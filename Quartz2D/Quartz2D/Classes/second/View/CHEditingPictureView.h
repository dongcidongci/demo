//
//  CHEditingPictureView.h
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHEditingPictureView;
@protocol CHEditingPictureViewDelegate <NSObject>

- (void)editingPictureView:(CHEditingPictureView *)editingPictureView image:(UIImage *)image;

@end

@interface CHEditingPictureView : UIView
/**<#注释#>*/
@property (nonatomic, strong)UIImage *image;
/**快速创建对象*/
+ (instancetype)editingPictureView;
/**代理属性 */
@property(weak, nonatomic) id <CHEditingPictureViewDelegate>delegate;
@end
