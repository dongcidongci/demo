//
//  CHUnlockedViewController.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHUnlockedViewController.h"
#import "CHUnlockedButtonsView.h"
#import "CHPaintViewController.h"

@interface CHUnlockedViewController ()<CHUnlockedButtonsViewDelegate>
@property (weak, nonatomic) IBOutlet CHUnlockedButtonsView *unlockedView;


@end

@implementation CHUnlockedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.unlockedView.delegate = self;
    
}

- (void)unlockedView:(CHUnlockedButtonsView *)unlockedView selectedButtonTag:(NSString *)selectedButtonTag{
//    NSLog(@"%s", __func__);
    NSString *pwd = [CHTools valueForKey:@"密码"];
    if (!pwd) {
        [CHTools setValue:selectedButtonTag forKey:@"密码"];
        [CHTools saveNow];
        
    }else{
        
        if ([selectedButtonTag isEqualToString:pwd]) {
            CHPaintViewController *paintVc = [[CHPaintViewController alloc] init];
            paintVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:paintVc animated:YES];
        }else{
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"密码错误,请重输密码" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
                
            }];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            [alert addAction:action1];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    
    

}
@end
