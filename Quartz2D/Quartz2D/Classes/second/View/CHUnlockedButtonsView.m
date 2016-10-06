//
//  CHUnlockedButtonsView.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/6.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "CHUnlockedButtonsView.h"
#import "CHButton.h"
#define Count 10

@interface CHUnlockedButtonsView ()
/**选择的按钮*/
@property (nonatomic, strong)NSMutableArray *selectedBtn;
@property(nonatomic, assign)CGPoint currentPiont;

@end

//中心思想是:把选中的按钮保存起来,在绘图方法里面取出来,拿到piont,再画线
@implementation CHUnlockedButtonsView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubviews];
        
        
    }
    return self;
}

+ (instancetype)unlockedButtonsView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (void)awakeFromNib{
    [self setUpSubviews];
}
- (void)setUpSubviews{
    for (int i = 0; i < 10; i ++) {
        CHButton *btn = [CHButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
//        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
//        [btn setAttributedTitle:nil forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        if (i == 9) {
           [btn setTitle:@"0" forState:UIControlStateNormal];
            btn.tag = 0;
        }
        else{
        [btn setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
            btn.tag = i + 1;
        }
        [self addSubview:btn];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat margin = 10;
    NSInteger cols = 3;
    NSInteger rows = 4;
    CGFloat btnW = (self.width - (cols - 1) * margin) / cols;
    CGFloat btnH = (self.height - (rows - 1) * margin) / rows;
    CGFloat x = 0;
    CGFloat y = 0;
    for (NSInteger i = 0; i < self.subviews.count; i ++) {
        CHButton *btn = self.subviews[i];
        x = (btnW + margin) * (i % cols);
        y = (btnH + margin) * (i / cols);
        if (i == 9) {
            x = (btnW + margin) * ((i + 1) % cols);
            btn.frame = CGRectMake(x, y, btnW, btnH);
        }
        btn.frame = CGRectMake(x, y, btnW, btnH);
    }
   
    
    
    
    
    
    
}
- (NSMutableArray *)selectedBtn{
    if (_selectedBtn == nil) {
        _selectedBtn = [NSMutableArray array];
    }
    return _selectedBtn;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CHButton *btn = [self buttonContainPiontWithTouch:touch];
    if (btn && btn.selected == NO) {
        [self.selectedBtn addObject:btn];
        btn.selected = YES;
    }
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    self.currentPiont = [touch locationInView:self];
    CHButton *btn = [self buttonContainPiontWithTouch:touch];
    if (btn && btn.selected == NO) {
        [self.selectedBtn addObject:btn];
        btn.selected = YES;
    }
    //一边移动手指,一边调用绘图方法画线
    [self setNeedsDisplay];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableString *str = [NSMutableString string];
    for (CHButton *btn in self.selectedBtn) {
        btn.selected = NO;
        [str appendString:[NSString stringWithFormat:@"%ld", btn.tag]];
    }
    [self.selectedBtn removeAllObjects];
    //手指离开屏幕,调绘图方法,把之前画的线全部清除
    [self setNeedsDisplay];
//    NSLog(@"%@",str);
    
    if ([self.delegate respondsToSelector:@selector(unlockedView:selectedButtonTag:)]) {
        [self.delegate unlockedView:self selectedButtonTag:str];
    }
    
}

#pragma mark - 判断点在不在按钮上
- (CHButton *)buttonContainPiontWithTouch:(UITouch *)touch{
    CGPoint piont = [touch locationInView:self];
    for (CHButton *btn in self.subviews) {
        //苹果提供的一些常用函数,判断一个点在不在矩形框内(c语言的)
        if (CGRectContainsPoint(btn.frame, piont)) {
            return btn;
        }
    }
    return nil;
}


- (void)drawRect:(CGRect)rect{
    //有选中按钮才需要画线
    if (_selectedBtn) {
       UIBezierPath *path = [UIBezierPath bezierPath];
        
        for (int i = 0; i < self.selectedBtn.count; i ++) {
            CHButton *btn = self.selectedBtn[i];
            if (i == 0) {
                
                [path moveToPoint:btn.center];
            }else{
                [path addLineToPoint:btn.center];
            }
        }
        //到最后要添加一条线到用户的手指,增强用户体验
        [path addLineToPoint:self.currentPiont];
        path.lineWidth = 15;
        [[UIColor redColor]set];
        path.lineJoinStyle = kCGLineJoinRound;
        [path stroke];
       
    }
}


@end
