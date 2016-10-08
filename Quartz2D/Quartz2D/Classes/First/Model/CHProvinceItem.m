//
//  CHProvinceItem.m
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHProvinceItem.h"

@implementation CHProvinceItem

+ (instancetype)provinceItemWithDict:(NSDictionary *)dict{
    CHProvinceItem *provinceItem = [[CHProvinceItem alloc] init];
    [provinceItem setValuesForKeysWithDictionary:dict];
    return provinceItem;
}

@end
