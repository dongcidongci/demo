//
//  CHProgressView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHProgressView.h"
#import "CHDrawView.h"

@interface CHProgressView ()
@property (weak, nonatomic) IBOutlet CHDrawView *drawView;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
@implementation CHProgressView

//- (void)setProgress:(CGFloat)progress{
//    _progress = progress;
//    [self.drawView setProgress:progress];
//}
+ (instancetype)progressView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (IBAction)valueChanged:(UISlider *)sender {
    self.valueLabel.text = [NSString stringWithFormat:@"%0.0lf%%",sender.value * 100];
    self.drawView.progress = sender.value;
}


@end
