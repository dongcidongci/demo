//
//  CHSnowViewController.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHSnowViewController.h"
#import "CHPikerViewController.h"

#import "CHSnowImageView.h"

@interface CHSnowViewController ()

/**定时器*/
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CHSnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //添加背景图片控件
   UIImageView *bgImageView = [[UIImageView alloc]init];
    bgImageView.image = [UIImage imageNamed:@"snowbg"];
    bgImageView.frame = CGRectMake(0, 64, CHSCREENW, CHSCREENH - 64);
    [self.view addSubview:bgImageView];
    [self startTimer];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"资料填写" style:0 target:self action:@selector(fillOut)];

}
- (void)fillOut{
    CHPikerViewController *piker = [[CHPikerViewController alloc] init];
    piker.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:piker animated:YES];
}
- (void)startTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(snowing) userInfo:nil repeats:YES];
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
    snowImageView.image = [UIImage imageNamed:@"snow"];
    CGFloat x = [self getX];
    snowImageView.frame = CGRectMake(x, 0, 60, 60);
    [snowImageView change];
    [self.view addSubview:snowImageView];
}
//定时器调用的方法
- (void)snowing{
    //创建雪花
    [self setUp];
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
- (void)viewWillAppear:(BOOL)animated{
    [self startTimer];
}
- (void)viewDidDisappear:(BOOL)animated{
    [self stopTimer];
}

@end
