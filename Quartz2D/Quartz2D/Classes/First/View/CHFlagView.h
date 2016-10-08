//
//  CHFlagView.h
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHFlagItem;

@interface CHFlagView : UIView
/**国旗模型*/
@property (nonatomic, strong) CHFlagItem *flagItem;
+ (instancetype)flagView;
@end
