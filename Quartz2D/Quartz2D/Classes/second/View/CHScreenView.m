//
//  CHScreenView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHScreenView.h"

@implementation CHScreenView


- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg"];
    [image drawInRect:rect];
    
}


@end
