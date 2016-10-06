//
//  CHUnlockedButtonsView.h
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHUnlockedButtonsView;
@protocol CHUnlockedButtonsViewDelegate <NSObject>

- (void)unlockedView:(CHUnlockedButtonsView *)unlockedView selectedButtonTag:(NSString *)selectedButtonTag;

@end
@interface CHUnlockedButtonsView : UIView
/**方便的构造方法*/
+ (instancetype)unlockedButtonsView;
/**代理属性 */
@property(weak, nonatomic) id <CHUnlockedButtonsViewDelegate>delegate;

@end
