//
//  CHFlagItem.m
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHFlagItem.h"


@implementation CHFlagItem

+ (instancetype)flagItemWithDict:(NSDictionary *)dict{
    CHFlagItem *flagItem = [[CHFlagItem alloc] init];
    [flagItem setValuesForKeysWithDictionary:dict];
    return flagItem;
}

//重写图像的set方法
//- (void)setIcon:(UIImage *)icon{
////    一定要做类型强制,这样才能获取字符串来给image创建image对象
//    NSString *str = (NSString *)icon;
////    NSString
//    UIImage *image = [UIImage imageNamed:str];
//    _icon = image;
//}





@end
