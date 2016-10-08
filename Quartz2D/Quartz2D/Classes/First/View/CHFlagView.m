//
//  CHFlagView.m
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHFlagView.h"
#import "CHFlagItem.h"

@interface CHFlagView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageV;

@end

@implementation CHFlagView


- (void)setFlagItem:(CHFlagItem *)flagItem{
    _flagItem = flagItem;
    self.nameLabel.text = flagItem.name;
    self.flagImageV.image = [UIImage imageNamed:flagItem.icon];
}

+ (instancetype)flagView{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    return views.lastObject;
}

@end
