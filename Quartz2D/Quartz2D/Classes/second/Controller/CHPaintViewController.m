//
//  CHPaintViewController.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHPaintViewController.h"
#import "CHPaintView.h"
#import "CHEditingPictureView.h"

@interface CHPaintViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, CHEditingPictureViewDelegate>
@property (weak, nonatomic) IBOutlet CHPaintView *paintView;
/**<#注释#> */
@property(weak, nonatomic) CHEditingPictureView *editingView;
@property(nonatomic, assign, getter=isPainting)BOOL painting;
@end

@implementation CHPaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:0 target:self action:@selector(back)];
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 清楚所有涂鸦
- (IBAction)clearAllPainting:(UIBarButtonItem *)sender {
    [self.paintView clear];
    [self.editingView removeFromSuperview];
}
#pragma mark - 撤销涂鸦
- (IBAction)undo:(UIBarButtonItem *)sender {
    if (self.isPainting) {
        [self.paintView undo];
        
    }else{
        [self.editingView removeFromSuperview];
        self.painting = YES;
        
    }
}
#pragma mark - 擦除涂鸦
- (IBAction)erasePainting:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"橡皮擦"]) {
        sender.title = @"画笔";
        [self.paintView erase];
    }else{
        sender.title = @"橡皮擦";
        [self.paintView paint];
    }
}
#pragma mark - 设置画笔笔尖大小
- (IBAction)lineWidth:(UISlider *)sender {
    [self.paintView lineWidth:sender.value];
}
#pragma mark - 换画笔颜色
- (IBAction)changeColor:(UIButton *)sender {
    [self.paintView changeColor:sender.backgroundColor];
    
}
#pragma mark - 保存涂鸦到系统相册
- (IBAction)savePainting:(UIBarButtonItem *)sender {
    UIGraphicsBeginImageContext(self.paintView.bounds.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.paintView.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    /**
     *<#id  _Nullable completionTarget#>,谁来调用方法
     *<#SEL  _Nullable completionSelector#>,完成写入之后调的方法,必须是系统规定的方法didFinished....
     *<#void * _Nullable contextInfo#>)要传给系统方法的参数
     *假如不想监听了,就传nil
     */
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    
}
#pragma mark - 链接系统相册
- (IBAction)photos:(UIBarButtonItem *)sender {
    UIImagePickerController *imageP = [[UIImagePickerController alloc] init];
    imageP.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imageP.delegate = self;
    
    [self presentViewController:imageP animated:YES completion:nil];
    self.painting = NO;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //根据info里面的key,取出图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    CHEditingPictureView *editingView = [[CHEditingPictureView alloc] init];
    editingView.frame = self.paintView.bounds;
    editingView.image = image;
    editingView.delegate = self;
    [self.paintView addSubview:editingView];
    self.editingView = editingView;
//    NSLog(@"%@", info);
    //把系统相册dismiss
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - CHEditingPictureViewDelegate
- (void)editingPictureView:(CHEditingPictureView *)editingPictureView image:(UIImage *)image{
//    NSLog(@"sss");
    self.painting = YES;
    self.paintView.image = image;
}








@end
