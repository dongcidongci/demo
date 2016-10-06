//
//  UIView+CHFrame.m
//  城觅01
//
//  Created by moxuyou on 16/9/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "UIView+CHFrame.h"
#import <objc/runtime.h>
@implementation UIView (CHFrame)
#pragma mark - getter
- (CGFloat )x{
    return self.frame.origin.x;
}
- (CGFloat )y{
    return self.frame.origin.y;
}
- (CGFloat )width{
    return self.frame.size.width;
}
- (CGFloat )height{
    return self.frame.size.height;
}
- (CGFloat)centerX{
    return self.center.x;
}
- (CGPoint)origin{
    return self.frame.origin;
}
- (CGSize)size{
    return self.frame.size;
}
#pragma mark - setter
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerY{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

static char nametag_key;

- (void)setNameTag:(NSString *)NameTag {
    objc_setAssociatedObject(self, &nametag_key, NameTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)nameTag {
    return objc_getAssociatedObject(self, &nametag_key);
}

- (UIView *)viewWithNameTag:(NSString *)aName {
    if (!aName) return nil;
    
    // Is this the right view?
    if ([[self nameTag] isEqualToString:aName])
        return self;
    // Recurse depth first on subviews;
    for (UIView *subview in self.subviews) {
        UIView *resultView = [subview viewNamed:aName];
        if (resultView) return  resultView;
    }
    // Not found
    return nil;
}

- (UIView *)viewNamed:(NSString *)aName {
    if (!aName) return nil;
    return [self viewWithNameTag:aName];
}

@end
