//
//  CHTools.m
//  lost02
//
//  Created by moxuyou on 16/9/24.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHTools.h"

@implementation CHTools

+ (NSString *)valueForKey:(NSString *)key{
    NSString *preVersion = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return preVersion;
}
+ (NSString *)currentVersion{
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    return currentVersion;
}
+ (void)setValue:(id)value forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    
}
+ (void)saveNow{
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
