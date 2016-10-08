//
//  CHProvinceItem.h
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHProvinceItem : NSObject
/** 省份 */
@property (nonatomic, copy)NSString *name;
/**省份下的城市*/
@property (nonatomic, strong)NSArray *cities;

+ (instancetype)provinceItemWithDict:(NSDictionary *)dict;
@end
