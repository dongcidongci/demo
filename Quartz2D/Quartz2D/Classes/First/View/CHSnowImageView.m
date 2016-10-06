//
//  CHSnowImageView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSnowImageView.h"

@interface CHSnowImageView ()
@property(nonatomic, assign) CGFloat direction;
@end
@implementation CHSnowImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       self.layer.opacity = 0.3;
        self.layer.transform = CATransform3DScale(self.layer.transform, 0.3, 0.3, 0.3);
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
            [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        //这个值要跟定时器同时产生
        self.direction = [self getAngle];
    }
    return self;
}
/**CA定时器调用的方法*/
- (void)rotate{
//    CGFloat angle = [self getAngle];
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

- (void)dealloc{
    NSLog(@"%s", __func__);
}
@end
