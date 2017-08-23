//
//  RHTitleView.m
//  YDTX
//
//  Created by RookieHua on 2017/3/31.
//  Copyright © 2017年 RookieHua. All rights reserved.
//

#import "RHTitleView.h"

// 屏幕宽/高
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define DEFAULT_FONT 16
#define SELECT_FONT 16
#define DEFAULT_COLOR [UIColor lightGrayColor]
#define SELECT_COLOR [UIColor blackColor]
#define LINE_COLOR [UIColor redColor]
#define LINE_H 2

@interface RHTitleView ()
@property (nonatomic,strong) UIView *bottomLine;
@property (strong, nonatomic) UIButton *selectBtn;
@end

@implementation RHTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}




#pragma mark - event
- (void)titleBtnDidClick:(UIButton *)aSender{
//    NSLog(@"did click titleBtn:%@",aSender.titleLabel.text);
    
    self.selectBtn.enabled = YES;
    self.selectBtn.titleLabel.font = [UIFont systemFontOfSize:self.defaultFont ? self.defaultFont :DEFAULT_FONT];
    aSender.enabled = NO;
    self.selectBtn = aSender;
    
    CGSize titleSize = [aSender.titleLabel.text sizeWithAttributes:@{NSFontAttributeName :                             [UIFont systemFontOfSize:self.selectFont ? self.selectFont : SELECT_FONT],NSForegroundColorAttributeName :self.selectColor ? self.selectColor : SELECT_COLOR}];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        aSender.titleLabel.font = [UIFont systemFontOfSize:self.selectFont ? self.selectFont :SELECT_FONT];
        
        self.bottomLine.frame = CGRectMake(aSender.tag *aSender.frame.size.width + (aSender.frame.size.width - titleSize.width)*0.5 - 10, aSender.frame.size.height, titleSize.width + 20, self.lineH ? self.lineH : LINE_H);
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(titleViewDidClickWithIndex:)]) {
        [_delegate titleViewDidClickWithIndex:aSender.tag];
    }
}

#pragma mark - public mthods
- (void)createUIWithTitleArray:(NSArray *)titleArray{
//    self.backgroundColor = [UIColor cyanColor];
    
    CGFloat lineH = self.lineH ? self.lineH : 2;
    CGFloat defaultFont = self.defaultFont ? self.defaultFont : DEFAULT_FONT;
    UIColor *defaultColor = self.defaultColor ? self.defaultColor : DEFAULT_COLOR;
    UIColor *selectColor = self.selectColor ? self.selectColor : SELECT_COLOR;
    
    NSInteger btnCount = titleArray.count;
    CGFloat btnW = ScreenWidth/btnCount;
    CGFloat btnH = self.frame.size.height - lineH;
    
    for (int i = 0; i<btnCount; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*btnW, 0, btnW, btnH)];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:defaultColor forState:UIControlStateNormal];
        [btn setTitleColor:selectColor forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:defaultFont];
        btn.tag = i;
        [btn addTarget:self action:@selector(titleBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:btn];
    }
    //下划线View
    
    [self addSubview:self.bottomLine];
    //默认选中第一个
    UIButton *selectBtn = self.subviews[0];
    [self titleBtnDidClick:selectBtn];
}
//默认选中第几个
- (void)defaultSelectTitleIndex:(NSInteger)Titleindex{
    UIButton *selectBtn = self.subviews[Titleindex];
    [self titleBtnDidClick:selectBtn];
}

#pragma mark - getter
- (UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = self.lineColor ? self.lineColor : LINE_COLOR;
    }
    return _bottomLine;
}

@end

