//
//  CHDrawView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHDrawView.h"

@implementation CHDrawView

- (void)setProgress:(CGFloat)progress{
    _progress = progress;

    [self setNeedsDisplay];
}
//想要通过绘图的方式展示内容在view上面,必须重写drawRect:方法
//什么时候调用:在View显示时调用,通过[self setNeedsDisplay];也可以调用
- (void)drawRect:(CGRect)rect {

    [self drawProgressView];
}
/**画进度条*/
- (void)drawProgressView{
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //圆心的位置
    CGPoint center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    //扇形的圆形半径
    CGFloat radius = self.frame.size.width * 0.5 - 2;
    CGFloat startAngle = - M_PI_2;
    //这个结束角度是关键
    CGFloat endAngle = startAngle + self.progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor colorWithWhite:1 alpha:0.3] set];
    //    CGContextAddPath(ctx, path.CGPath);
    //    CGContextFillPath(ctx);
    [path fill];
}













@end
