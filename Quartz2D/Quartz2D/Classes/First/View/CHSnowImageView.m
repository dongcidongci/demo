//
//  CHSnowImageView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSnowImageView.h"

extern NSInteger indeyyy;
@interface CHSnowImageView ()
/**旋转的方向*/
@property(nonatomic, assign) CGFloat direction;
/**修改后的x值*/
@property(nonatomic, assign) CGFloat x;
/**定时器*/
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation CHSnowImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //透明度
       self.layer.opacity = 0.3;
        //通过layer层缩小尺寸
        self.layer.transform = CATransform3DScale(self.layer.transform, 0.3, 0.3, 0.3);
        //添加定时器让图案旋转
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
            [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        self.link = link;
        //这个值要跟定时器同时产生
        self.direction = [self getAngle];
        self.x = [self getX];
    }
    return self;
}
/**修改frame*/
- (void)change{    
    
   //__weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:10.0 animations:^{
        self.center = CGPointMake(self.x, CHSCREENH);
        
    } completion:^(BOOL finished) {
        //在父控件移除
        [self removeFromSuperview];
        //把定时器在运行循环中移除(不移除的话,self不会dealloc),定时器会对控件进行retain的
        [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        [self.link invalidate];
        
    }];
}

/**CA定时器调用的方法*/
- (void)rotate{
    //不同方向地旋转
    self.layer.transform = CATransform3DRotate(self.layer.transform, self.direction * M_PI_2 / 300.0, 0, 0, 1);
    
}
/**决定旋转的方向*/
- (CGFloat)getAngle{
    CGFloat x = arc4random_uniform(CHSCREENW + 30);
    if (x > CHSCREENW * 0.5) {
        return -1;
    }else{    
    return 1;
    }
}

/**获取随机的x值*/
- (CGFloat)getX{
    CGFloat x = arc4random_uniform(CHSCREENW);
    return x;
}
@end
