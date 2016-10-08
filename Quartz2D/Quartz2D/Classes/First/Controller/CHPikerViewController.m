//
//  CHPikerViewController.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/7.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHPikerViewController.h"
#import "CHFlagTFiled.h"
#import "CHProvinceTField.h"
#import "CHDateTField.h"
#import "CHHitTestBtn.h"

@interface CHPikerViewController ()
/**<#注释#> */
@property(weak, nonatomic) CHHitTestBtn *btn;
@end

@implementation CHPikerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpWithType:@"国家" index: 0 class:@"CHFlagTFiled"];
    [self setUpWithType:@"省份" index: 1 class:@"CHProvinceTField"];
    [self setUpWithType:@"生日" index: 2 class:@"CHDateTField"];
    
    [self addMoveBtn];
    
}
#pragma mark - 添加可移动的按钮
- (void)addMoveBtn{
    CHHitTestBtn *btn = [CHHitTestBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, 200, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点我呀" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
}
#pragma mark - 监听按钮的点击
- (void)show{
    [self.view endEditing:YES];
    //添加超出其父控件frame的子控件
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(180, -80, 100, 80)];
    [btn setBackgroundImage:[UIImage imageNamed:@"对话框"]  forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    self.btn.popBtn = btn;
    [self.btn addSubview:btn];
    
    
}
//初始化textFiled
- (void)setUpWithType:(NSString *)type index:(NSInteger)index class:(NSString *)class{
    
        static CGFloat margin  = 20;
        static CGFloat nameX = 80;
        static CGFloat nameH = 30;
        static CGFloat y = 300;
        static CGFloat textFX = 0;
        CGFloat nameY = y;
    
        UILabel *name = [[UILabel alloc] init];
        nameY = y + (nameH + margin) * index;
        name.font = [UIFont systemFontOfSize:20];
        name.text = [NSString stringWithFormat:@"%@:", type];
        name.frame = CGRectMake(nameX, nameY, 50, nameH);
        [self.view addSubview:name];
    
        UITextField *textF = [[NSClassFromString(class) alloc] init];
        textF.borderStyle = UITextBorderStyleRoundedRect;
        textFX = CGRectGetMaxX(name.frame) + margin;
        textF.frame = CGRectMake(textFX, nameY, 150, nameH);
        [self.view addSubview:textF];
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
