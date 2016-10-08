//
//  CHDateTField.m
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHDateTField.h"

@implementation CHDateTField

//初始化键盘
- (void)awakeFromNib{

    [self setUp];
}
//
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
- (void)setUp{
    UIDatePicker *dateP = [[UIDatePicker alloc]init];
    dateP.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    dateP.datePickerMode = UIDatePickerModeDate;
    self.inputView = dateP;
    [dateP addTarget:self action:@selector(selectedDate:) forControlEvents:UIControlEventValueChanged];
    
}
- (void)selectedDate:(UIDatePicker *)datePicker{
//    时间对象转字符串显示出去
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    dateF.dateFormat = @"yyyy-MM-dd";
    NSString *str = [dateF stringFromDate: datePicker.date];
    self.text = str;
    
}
//点击textFiled,立即显示数组中第一个元素的name
- (void)initTextField{
    [self selectedDate:(UIDatePicker *)self.inputView];
}
@end
