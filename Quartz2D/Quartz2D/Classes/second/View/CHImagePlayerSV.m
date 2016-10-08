//
//  CHImagePlayerSV.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/7.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHImagePlayerSV.h"

@interface CHImagePlayerSV ()<UIScrollViewDelegate>
/**显示在用户眼前的图片控件 */
@property(weak, nonatomic) UIImageView *showImageV;
/**重用的图片控件 */
@property(weak, nonatomic) UIImageView *reusableImageView;
/**<#注释#> */
@property(weak, nonatomic) UIPageControl *page;
/**<#注释#>*/
@property (nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign)NSInteger pageNumber;
@end
@implementation CHImagePlayerSV

- (UIPageControl *)page{
    if (_page == nil) {
        UIPageControl *page = [[UIPageControl alloc] init];
        CGFloat height = 30;
        CGFloat width = 100;
        CGFloat margin = 10;
        page.currentPageIndicatorTintColor = [UIColor redColor];
        page.pageIndicatorTintColor = [UIColor blueColor];
        page.numberOfPages = self.imageArray.count;
        page.frame = CGRectMake(2 * self.width - margin - width, self.height - margin - height, width, height);
        page.currentPage = 0;
        [self addSubview:page];
        [self timer];
        _page = page;
    }
    return _page;
}
- (UIImageView *)showImageV{
    if (_showImageV == nil) {
        //总是看得见的imageView
        UIImageView *showImageV = [[UIImageView alloc] init];
        
        showImageV.frame = CGRectMake(self.width, 0, self.width, self.height);
        showImageV.image = [UIImage imageNamed:self.imageArray[0]];
        showImageV.tag = 0;
        [self addSubview:showImageV];
        _showImageV = showImageV;
    }
    return _showImageV;
}
- (UIImageView *)reusableImageView{
    if (_reusableImageView == nil) {
        //总是看得见的imageView
        UIImageView *reusableImageView = [[UIImageView alloc] init];
        
        reusableImageView.frame = self.bounds;
        [self addSubview:reusableImageView];
        _reusableImageView = reusableImageView;
    }
    return _reusableImageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self addImageView];
        self.pagingEnabled = YES;
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        //[self startTimer];
    }
    return self;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%s", __func__);
    //[self timer];
    CGFloat offset = scrollView.contentOffset.x;
    CGFloat selfW = self.width;
    NSInteger index = 0;
    
    if (offset > self.showImageV.x) {
        self.reusableImageView.x = CGRectGetMaxX(self.showImageV.frame);
       index = self.showImageV.tag + 1;
        if (index >= self.imageArray.count) {
            index = 0;
        }
    }else{
        self.reusableImageView.x = 0;
       index = self.showImageV.tag - 1;
        if (index < 0) {
            index = self.imageArray.count - 1;
        }
    }
    
    self.reusableImageView.tag = index;
        
        self.reusableImageView.image = [UIImage imageNamed:self.imageArray[index]];
   
    //NSLog(@"%ld", index);
    if (index == self.imageArray.count -1) {
        
        self.page.currentPage = 0;
        self.pageNumber = 0;
    }else{
        self.page.currentPage = index + 1;
        self.pageNumber = index + 1;
    }
    if (offset <= 0 || offset >= 2 * selfW) {
        UIImageView *tempView = self.showImageV;
        self.showImageV = self.reusableImageView;
        self.reusableImageView = tempView;
            self.showImageV.frame = self.reusableImageView.frame;
        self.contentOffset = CGPointMake(selfW, 0);
    }
}


- (void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    self.showImageV.image = [UIImage imageNamed:imageArray[0]];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self timer];
}


- (NSTimer *)timer{
    if (_timer == nil) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        _timer = timer;

    }
    return _timer;
}
- (void)nextPage{
    self.page.currentPage = self.pageNumber;
   CGPoint piont = self.contentOffset;

    self.contentOffset = CGPointMake(piont.x + self.width, 0);
}
- (void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}





@end
