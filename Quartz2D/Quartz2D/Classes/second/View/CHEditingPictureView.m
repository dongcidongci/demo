//
//  CHEditingPictureView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHEditingPictureView.h"
@interface CHEditingPictureView ()<UIGestureRecognizerDelegate>
/**<#注释#> */
@property(weak, nonatomic) UIImageView *imageView;
@end
@implementation CHEditingPictureView

- (UIImageView *)imageView{
    if (_imageView == nil) {
//        [self setUp];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        _imageView = imageView;
        //这个方法一定要在imageView有值了才能调用,否则会死循环
        [self addGest];
    }
    return _imageView;
}
+ (instancetype)editingPictureView{
   CHEditingPictureView *view
    = [[self alloc] init];
    return view;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}

- (void)addGest{
    //添加拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:pan];
  
    //添加捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
    //长按手势
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    [self.imageView addGestureRecognizer:longP];
    
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    rotate.delegate = self;
    [self.imageView addGestureRecognizer:rotate];
    
}
- (void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan translationInView:self.imageView];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, point.x, point.y);
    [pan setTranslation:CGPointZero inView:self.imageView];
    
}
- (void)rotate:(UIRotationGestureRecognizer *)rotate{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotate.rotation);
    [rotate setRotation:0];
}
- (void)pinch:(UIPinchGestureRecognizer *)pinch{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale, pinch.scale);
    //复位(pinch.scale是相对于最初那个位置的,而上面那个方法是相对于上一次的缩放比例)
    pinch.scale = 1;
    
}
- (void)longP:(UILongPressGestureRecognizer *)longP{
    //当长按手势一开始的时候
    if (longP.state == UIGestureRecognizerStateBegan) {
        //UIView动画
        [UIView animateWithDuration:0.2 animations:^{
            self.imageView.alpha = 0;
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                self.imageView.alpha = 1;
            } completion:^(BOOL finished) {
                //开启位图上下文
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
                //获取位图上下文
                CGContextRef cxt = UIGraphicsGetCurrentContext();
                //把self的layer层渲染到view上面显示
                [self.layer renderInContext:cxt];
                //在位图上下文中生成一张图片
                UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
                //结束上下文
                UIGraphicsEndImageContext();
                //调代理方法,把数据传出去
                if ([self.delegate respondsToSelector:@selector(editingPictureView:image:)]) {
                    [self.delegate editingPictureView:self image:newImage];
                }
                //把self的子控件移除,否则他会遮住上面辛苦搞出来的图片
                [self.imageView removeFromSuperview];
                
            }];
            
        }];
        
        
    }
    
    
}

#pragma mark - UIGestureRecognizer的代理方法
//是否允许多手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

@end
