//
//  CHProvinceTField.m
//  自定义键盘(UITextField)
//
//  Created by moxuyou on 16/9/2.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHProvinceTField.h"
#import "MJExtension.h"
#import "CHProvinceItem.h"

@interface CHProvinceTField () <UIPickerViewDelegate, UIPickerViewDataSource>
/**省份模型*/
@property (nonatomic, strong)NSArray *provinceArray;
/**省份的角标*/
@property (nonatomic, assign)NSInteger currentRow;

@end

@implementation CHProvinceTField
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
    UIPickerView *pickView = [[UIPickerView alloc] init];
    pickView.delegate = self;
    pickView.dataSource = self;
    self.inputView = pickView;
}

- (NSArray *)provinceArray{
    if (_provinceArray == nil) {
        _provinceArray = [CHProvinceItem mj_objectArrayWithFilename:@"provinces.plist"];
    }
    return _provinceArray;
}
#pragma mark - UIPickerView数据源方法
//一共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
//一共有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        
        return self.provinceArray.count;
    }else{
//        选中哪个省份,根据这个省份去取出省份下的城市个数
        CHProvinceItem *provinceItem = self.provinceArray[self.currentRow];
        return provinceItem.cities.count;
        
    }
}

#pragma mark - UIPickerView代理方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        
        CHProvinceItem *provinceItem = self.provinceArray[row];
         ;
        return provinceItem.name;
    }else{
//        取出选中的省份
        CHProvinceItem *provinceItem = self.provinceArray[self.currentRow];
//        这个省份下的城市名称
        NSString *city = provinceItem.cities[row];
        return city;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
//        把当前选中的行赋值给属性current
        self.currentRow = row;
//        刷新数据源和代理方法
        [pickerView reloadAllComponents];
//        用户选中了某个省份之后,右边的城市总是选中第一个城市的文字
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
//    根据选中的行currentRow,取出对应的省份模型
    CHProvinceItem *provinceItem = self.provinceArray[self.currentRow];
    NSString *name = provinceItem.name;
    NSArray *array = provinceItem.cities;
//    拿到指定的列中被选中的行的角标
    NSInteger selectedRow = [pickerView selectedRowInComponent:1];
//    根据这个角标去取出城市数组中的城市名称
    NSString *city = array[selectedRow];
    NSString *str = [NSString stringWithFormat:@"%@-%@",name,city];
    self.text = str;
    
}
//点击textFiled,立即显示数组中第一个元素的省份名字以及他的第一个城市
- (void)initTextField{
    [self pickerView:(UIPickerView *)self.inputView didSelectRow:0 inComponent:0];
    
}


@end
