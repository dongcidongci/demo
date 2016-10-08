//
//  CHFlagTFiled.m
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHFlagTFiled.h"
#import "CHFlagItem.h"
#import "CHFlagView.h"


@interface CHFlagTFiled ()<UIPickerViewDelegate,UIPickerViewDataSource>
/**flag模型*/
@property (nonatomic, strong)NSArray *flagItems;

@end
@implementation CHFlagTFiled

//xib或者storyboard中加载完毕后调用的方法
- (void)awakeFromNib{
    [self setUp];
}
//在纯代码创建textField的时候会调用的方法
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

//键盘设置
- (void)setUp{
    UIPickerView *pickView = [[UIPickerView alloc] init];
    pickView.delegate = self;
    pickView.dataSource = self;
    self.inputView = pickView;
    
}

- (NSArray *)flagItems{
    if (_flagItems == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *flagDict in array) {
           CHFlagItem *flagItem = [CHFlagItem flagItemWithDict:flagDict];
            [arrM addObject:flagItem];
        }
        _flagItems = arrM;
    }
    return _flagItems;
}
#pragma mark - UIPickView数据源方法
//一共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//每列一共有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flagItems.count;
}

#pragma mark - UIPickVie代理方法
//每行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 130;
}
//列与列之间的间距
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 100;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    CHFlagView *flagView = [CHFlagView flagView];
//    取出模型
    CHFlagItem *flagItem = self.flagItems[row];
    flagView.flagItem = flagItem;
//    NSLog(@"%@---%@", flagItem.icon, flagItem.name);
    return flagView;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    CHFlagItem *flagItem = self.flagItems[row];
    self.text = flagItem.name;
}

- (void)initTextField{
    CHFlagItem *flagItem = self.flagItems[0];
    self.text = flagItem.name;
}


@end
