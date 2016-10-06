//
//  CHTools.h
//  lost02
//
//  Created by moxuyou on 16/9/24.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHTools : NSObject
/**根据key在偏好设置中取出之value*/
+ (NSString *)valueForKey:(NSString *)key;
///**保存当前版本号到偏好设置去*/
//+ (void)saveCurrentVersionForKey:(NSString *)key;
/**info.plist中读取版本号*/
+ (NSString *)currentVersion;
/**以这个key把value保存到偏好设置中去*/
+ (void)setValue:(id)value forKey:(NSString *)key;
/**立刻写入沙盒*/
+ (void)saveNow;
@end
