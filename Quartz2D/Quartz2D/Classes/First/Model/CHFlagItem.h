//
//  CHFlagItem.h
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CHFlagItem : NSObject
/** 名字 */
@property (nonatomic, copy)NSString *name;
/**图片对象*/
//@property (nonatomic, weak)UIImage *icon;
/***/
@property (nonatomic, strong)NSString *icon;
+ (instancetype)flagItemWithDict:(NSDictionary *)dict;
@end
