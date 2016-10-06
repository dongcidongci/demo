//
//  CHSnowViewController.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSnowViewController.h"
#import "CHSnowImageView.h"

@interface CHSnowViewController ()
/**雪花 */
@property(weak, nonatomic) CHSnowImageView *snowImageView;
@property(weak, nonatomic) CHSnowImageView *tempImageView;

/**定时器*/
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CHSnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setHidesBottomBarWhenPushed:YES];
    //添加背景图片控件
   UIImageView *bgImageView = [[UIImageView alloc]init];
    bgImageView.image = [UIImage imageNamed:@"snowbg"];
    bgImageView.frame = CGRectMake(0, 64, CHSCREENW, CHSCREENH - 64);
    [self.view addSubview:bgImageView];
    [self startTimer];
    


}

- (void)startTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(snow) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
- (void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}


//初始化雪花图片控件
- (void)setUp{
    CHSnowImageView *snowImageView = [[CHSnowImageView alloc] init];
//    [snowImageView addObserver:self forKeyPath:@"height" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
    snowImageView.image = [UIImage imageNamed:@"snow"];
    CGFloat x = [self getX];
    snowImageView.frame = CGRectMake(x, -100, 60, 60);
    [self.view addSubview:snowImageView];
    self.snowImageView = snowImageView;
}
//定时器调用的方法
- (void)snow{
    
        [self setUp];
    [UIView animateWithDuration:10.0 animations:^{
        self.snowImageView.center = CGPointMake([self getX], CHSCREENH + 100);
        
    } completion:^(BOOL finished) {
//        [self.snowImageView removeFromSuperview];
        for (UIView *view in self.view.subviews) {
//            NSLog(@"%@", view);
            if ([view isKindOfClass:[CHSnowImageView class]]) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [view removeFromSuperview];
                });
                
            }
        }


        
    }];

    
}
/**KVO自动调的方法*/
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    NSLog(@"%@", change);
//}
/**获取随机X值*/
- (CGFloat)getX{
    CGFloat x = arc4random_uniform(CHSCREENW);
    return x;
}


@end
