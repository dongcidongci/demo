//
//  CHDrawView2.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHDrawView2.h"

@implementation CHDrawView2

//是Core Graphics框架的,数据类型和方法基本是以CG开头
- (void)drawRect:(CGRect)rect{
    //画图片
    [self drawPicture];
    //画线
    [self drawLine];
    //画文字
    [self drawText];
}
#pragma mark -画文字
- (void)drawText{
    //把文字画到view上面显示,不要label来显示了
    NSString *name = @"你好";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //文字字体
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    //颜色(这个字符代表的颜色,会改变整个视图的渲染颜色)
    dict[NSForegroundColorAttributeName] = [UIColor yellowColor];
    //描边
    dict[NSStrokeColorAttributeName] = [UIColor blueColor];
    dict[NSStrokeWidthAttributeName] = @1;
    //阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    //设置阴影的偏移量
    shadow.shadowOffset = CGSizeMake(-20, -10);
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowBlurRadius = 3.0;
    
    
    dict[NSShadowAttributeName] = shadow;
    //drawInPiont:也可以把文字显示上去,区别是,rect是会自动换行的
    [name drawInRect:CGRectMake(0, 0, 100, 50) withAttributes:dict];
    
}
#pragma mark -画图
- (void)drawPicture{
    UIImage *image = [UIImage imageNamed:@"IMG_3672"];
    CGFloat width = 80;
    CGFloat height = width;
    //设置裁剪范围(超过裁剪区域以外的内容都不显示)
    //UIRectClip(CGRectMake(0, 0, 50, 50));
    [image drawInRect:CGRectMake((self.frame.size.width - width) * 0.5, (self.frame.size.height - height) * 0.5, width, height)];
    //平铺
    //[image drawAsPatternInRect:self.bounds];
    
    //快速填充一个矩形
    //[[UIColor redColor] set];
    //UIRectFill(CGRectMake(50, 50, 100, 100));
    
}

#pragma mark -画扇形
- (void)drawPartRound{
    
/**
*第一个参数:扇形的圆心位置
*第二个参数:半径
*第三个参数:开始的角度(0代表在右手边水平位置开始)
*第四个参数:结束的角度
*第五个参数:是否顺时针画,YES代表是顺时针,NO代表逆时针
*/
UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
[path addLineToPoint:CGPointMake(150, 150)];
[[UIColor redColor] set];
[path fill];
}
#pragma mark -指定角变圆
- (void)drawRound{
/**
*第一个参数:在这个范围内画
*第二个参数:枚举,圆角的具体位置(左上,左下,右上,右下)
 *第三个参数:圆角半径
 */
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(150, 150)];
    [[UIColor redColor] set];
    [path fill];
}
#pragma mark -画有圆角的矩形
- (void)drawRoundWithCornerRadius{
    //画有圆角的矩形,当圆角半径==矩形的一半时,就是一个圆了
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) cornerRadius:150];
    [[UIColor redColor] set];
    [path fill];
}
#pragma mark - 根据指定的矩形框画圆(椭圆)
- (void)drawRound2{
    //根据指定的矩形框画圆(椭圆)
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [[UIColor redColor] set];
    [path fill];
}

#pragma mark - 通过指定的路径画线
- (void)drawLine{
    //保存上下文的状态(上下文状态栈当中)
    CGContextSaveGState(UIGraphicsGetCurrentContext());
    
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //描述路径(一个路径对象可以描述多条路径)
    [path moveToPoint:CGPointMake(100, 50)];
    [path addLineToPoint:CGPointMake(250, 50)];
    [path addLineToPoint:CGPointMake(250, 150)];
    
    [path moveToPoint:CGPointMake(270, 50)];
    [path addLineToPoint:CGPointMake(270, 150)];
    
    //设置路径的属性(自定义)
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    //颜色是要通过调用set方法才能设置的,而且必须得是在这个方法里面调用
    [[UIColor redColor] set];
    //把描述好的路径按照指定的方式显示到view上面
    [path stroke];
    
    
    //去上下文状态栈取path的状态来设置给新的path,取出的状态是在104行保存的那个状态
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(260, 100)];
    [path2 addLineToPoint:CGPointMake(290, 100)];
    [path2 stroke];
    //通过上下文状态栈,可以做到,不同的path有不同的样式
}

#pragma mark - 对状态栈的形变
- (void)ctxTransform{
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
        [[UIColor redColor] set];
        
        //必须得要在添加路径之前做矩阵操作.
        //平移
        CGContextTranslateCTM(ctx, 100, 50);
        //旋转
        CGContextRotateCTM(ctx, M_PI_2);
        //缩放
        CGContextScaleCTM(ctx, 0.5, 0.5);
        
        CGContextAddPath(ctx, path.CGPath);
        
        CGContextFillPath(ctx);
        
}
//可以不看这个方法,drawLine方法里面有比较详细的代码
- (void)status{
    //一个路径只能对应一个状态.
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20,270)];
    [path addLineToPoint:CGPointMake(280, 270)];
    
    CGContextAddPath(ctx, path.CGPath);
    
    //保存上下文的状态(上下文状态栈当中)
    CGContextSaveGState(ctx);
    
    //设置上下文状态
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    
    //保存上下文的状态(上下文状态栈当中)
//    CGContextSaveGState(ctx);
    
    
    CGContextStrokePath(ctx);
    
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(150, 250)];
    [path2 addLineToPoint:CGPointMake(150, 290)];
    CGContextAddPath(ctx, path2.CGPath);
    
    //设置上下文状态
    //    CGContextSetLineWidth(ctx, 1);
    //    [[UIColor blackColor] set];
    
    //从上下文状态栈中恢复状态
    CGContextRestoreGState(ctx);
//    CGContextRestoreGState(ctx);
    
    
    CGContextStrokePath(ctx);

}

@end
