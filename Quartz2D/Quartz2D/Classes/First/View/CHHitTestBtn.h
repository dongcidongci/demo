//
//  CHHitTestBtn.h
//  Quartz2D
//
//  Created by moxuyou on 16/10/7.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHHitTestBtn : UIButton
/**弹出来的子控件(超出父控件的Frame的了) */
@property(weak, nonatomic) UIButton *popBtn;
@end
