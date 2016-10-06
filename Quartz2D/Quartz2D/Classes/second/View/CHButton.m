//
//  CHButton.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHButton.h"

@implementation CHButton

- (void)setHighlighted:(BOOL)highlighted{
    
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return self.superview;
}
@end
