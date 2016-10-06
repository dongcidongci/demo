//
//  UIView+CHFrame.h
//  城觅01
//
//  Created by moxuyou on 16/9/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CHFrame)

@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat height;
@property(nonatomic, assign)CGFloat x;
@property(nonatomic, assign)CGFloat y;
@property(nonatomic, assign)CGFloat centerX;
@property(nonatomic, assign)CGFloat centerY;
@property(nonatomic, assign)CGPoint origin;
@property(nonatomic, assign)CGSize size;

/**设置view的字符串tag*/
- (NSString *)nameTag ;
/**查找这个名字的view*/
- (UIView *)viewNamed:(NSString *)aName;
/**取出view的字符串tag*/
- (void)setNameTag:(NSString *)NameTag;


@end
