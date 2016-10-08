//
//  CHImagePlayerViewController.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/7.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHImagePlayerViewController.h"
#import "CHImagePlayerSV.h"

@interface CHImagePlayerViewController ()//<UIScrollViewDelegate>
/**scrollView */
@property(weak, nonatomic) CHImagePlayerSV *scrollView;
@end

@implementation CHImagePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //scrollView 在导航控制器中有默认的偏移量,所以要手动设置为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray *array = @[@"00", @"01", @"02", @"03", @"04", @"05", @"06", @"07"];
    self.view.backgroundColor = [UIColor whiteColor];
    CHImagePlayerSV *scrollView = [[CHImagePlayerSV alloc] init];
    scrollView.frame = CGRectMake(10, 74, CHSCREENW - 20, 200);
    scrollView.imageArray = array;
    //scrollView.backgroundColor = [UIColor redColor];
    //设置scrollView的contentSize
    scrollView.contentSize = CGSizeMake(3 * scrollView.width, scrollView.height);
    
    scrollView.contentOffset = CGPointMake(scrollView.width, 0);
//    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
}
//#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//}
@end
