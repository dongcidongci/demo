//
//  CHViewController.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHViewController.h"
#import "CHSnowViewController.h"

#import "CHProgressView.h"
#import "CHDrawView.h"

#import "UIImage+clipImage.h"

@interface CHViewController ()

/**进度条的视图 */
//@property(weak, nonatomic) CHProgressView *progressView;

@end

@implementation CHViewController
#define CHTitleViewWH 50
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化子控件
    [self setUp];
    //导航条右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow_right"] style:UIBarButtonItemStylePlain target:self action:@selector(snow)];
    //导航条中间视图
    [self titleView];
    
    

}

#pragma mark - 导航条中间视图
- (void)titleView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.height = CHTitleViewWH;
    imageView.width = CHTitleViewWH;
    UIImage *image = [UIImage imageWithBorder:5.0 color:[UIColor redColor] image:[UIImage imageNamed:@"阿狸头像"]];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageView;
    
}
//导航条右边按钮点击
- (void)snow{
    CHSnowViewController *snowVC = [[CHSnowViewController alloc] init];
    snowVC.hidesBottomBarWhenPushed = YES;
//    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:snowVC animated:YES];
    
}

#pragma mark - 初始化背景图片控件
- (void)setUp{
    //添加背景图片控件
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [self getImageWithTitle];
    imageV.frame = self.view.bounds;
    [self.view insertSubview:imageV atIndex:0];
    //添加进度条
    CHProgressView *progressView = [CHProgressView progressView];
    progressView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200);
    [self.view addSubview:progressView];
    
    
}
#pragma mark - 画水印图片

- (UIImage *)getImageWithTitle{
    UIImage *image = [UIImage imageNamed:@"first_bg"];
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [image drawInRect:self.view.frame];
    NSString *title = @"SWEET_Junin";
    CGFloat titleW = 150;
    CGFloat titleH = 50;
    CGFloat x = self.view.width - titleW;
    CGFloat y = self.view.height - 49 - 10 - titleH;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    [title drawInRect:CGRectMake(x, y, titleW, titleH) withAttributes:dict];
    //   CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}







@end
