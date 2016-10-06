//
//  CHPaintView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHPaintView.h"
#import "CHBezierPath.h"
@interface CHPaintView ()
@property(nonatomic, assign)CGFloat lineWidth;
@property (nonatomic, strong)UIColor *lineColor;

/**路径*/
@property (nonatomic, strong) CHBezierPath *path;
/**路径数组*/
@property (nonatomic, strong)NSMutableArray *pathArray;
@end
@implementation CHPaintView
- (NSMutableArray *)pathArray{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lineWidth = 1;
        //添加拖拽手势
        [self panGest];
    }
    return self;
}
- (void)awakeFromNib{
    //添加拖拽手势
    self.lineWidth = 1;
    [self panGest];
}
#pragma mark - 添加拖拽手势
- (void)panGest{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}
- (void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint CurrentPiont = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        CHBezierPath *path = [CHBezierPath bezierPath];
        path.lineWidth = self.lineWidth;
        path.lineColor = self.lineColor;
        [path moveToPoint:CurrentPiont];
        self.path = path;
        [self.pathArray addObject:path];
    }else if (pan.state == UIGestureRecognizerStateChanged){
        [self.path addLineToPoint:CurrentPiont];
        [self setNeedsDisplay];
    }else if (pan.state == UIGestureRecognizerStateEnded){
        
    }
}

- (void)drawRect:(CGRect)rect {
    if (_pathArray.count) {
        for (NSObject *obj in self.pathArray) {
            if ([obj isKindOfClass:[CHBezierPath class]]) {
                CHBezierPath *path = (CHBezierPath *)obj;
                [path.lineColor set];
                [path stroke];
            }else{
                UIImage *image = (UIImage *)obj;
                [image drawInRect:rect];
            }
        }
    }
}
- (void)setImage:(UIImage *)image{
    _image = image;
    [self.pathArray addObject:image];
    [self setNeedsDisplay];
}

/**清除所有涂鸦*/
- (void)clear{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
    
}
/**撤销操作*/
- (void)undo{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
    
}
/**擦除涂鸦*/
- (void)erase{
    
    self.lineColor = [UIColor whiteColor];
    
}
- (void)paint{
    self.lineColor = [UIColor blackColor];
}
/**更改颜色*/
- (void)changeColor:(UIColor *)color{
    _lineColor = color;
}
/**设置笔尖大小*/
- (void)lineWidth:(CGFloat)size{
    _lineWidth = size;
}
@end
