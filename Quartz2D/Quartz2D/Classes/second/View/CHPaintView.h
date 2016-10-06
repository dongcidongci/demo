//
//  CHPaintView.h
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHPaintView : UIView

/**<#注释#>*/
@property (nonatomic, strong)UIImage *image;

/**清除所有涂鸦*/
- (void)clear;
/**撤销操作*/
- (void)undo;
/**擦除涂鸦*/
- (void)erase;
/**还原画笔*/
- (void)paint;
/**更改颜色*/
- (void)changeColor:(UIColor *)color;
/**设置笔尖大小*/
- (void)lineWidth:(CGFloat)size;



@end
