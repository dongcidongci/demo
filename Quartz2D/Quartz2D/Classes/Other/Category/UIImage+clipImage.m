//
//  UIImage+clipImage.m
//  裁剪图片
//
//  Created by moxuyou on 16/9/11.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "UIImage+clipImage.h"

@implementation UIImage (clipImage)
+ (UIImage *)imageWithBorder:(CGFloat)border color:(UIColor *)color image:(UIImage *)image{
    //图片对象
    //    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    /**************绘制边框的范围*************/
    //开启绘图上下文
    //    CGFloat border = 3;
    CGSize size = CGSizeMake(image.size.width + 2 * border, image.size.height + 2 * border);
    UIGraphicsBeginImageContext(size);
    //裁剪边框的绘制路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    //设置状态
    //    [[UIColor redColor] set];
    [color set];
    //渲染到上下文
    [path fill];
    /**************制定裁剪的路径*************/
    UIBezierPath *clipParh = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, image.size.width, image.size.height)];
    [clipParh addClip];
    [image drawAtPoint:CGPointMake(border, border)];
    //调用方法,生成一张按要求裁剪好的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文(自己开启的,一定要自己关闭)
    UIGraphicsEndPDFContext();
    return newImage;
    
}
@end
