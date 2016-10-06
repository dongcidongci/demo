//
//  UIImage+clipImage.h
//  裁剪图片
//
//  Created by moxuyou on 16/9/11.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (clipImage)
/**根据指定的宽度和颜色,返回一张圆形并且带边框的图片*/
+ (UIImage *)imageWithBorder:(CGFloat)border color:(UIColor *)color image:(UIImage *)image;
@end
