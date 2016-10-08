//
//  CHHitTestBtn.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/7.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHHitTestBtn.h"

@implementation CHHitTestBtn

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.popBtn) {
        //把当前的点转到子控件坐标系上
        CGPoint pointPop = [self convertPoint:point toView:self.popBtn];
        //如果这个点再当前控件的范围内
        if ([self.popBtn pointInside:pointPop withEvent:event]) {
            //返回这个控件,作为最合适的view
            return self.popBtn;
        }
    }
    //其他情况,按照系统的方式寻找最合适的view
    return [super hitTest:point withEvent:event];
}
//让控件能够随便移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint previousP = [touch previousLocationInView:self];
    CGPoint currentP = [touch locationInView:self];
    CGFloat offsetX = currentP.x - previousP.x;
    CGFloat offsetY = currentP.y - previousP.y;
    //控件的形变,是以CGAFFineTransform开头的方法,而layer的形变的以CATransform开头的
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
}
@end
