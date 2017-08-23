//
//  ViewController.m
//  RHTitleView
//
//  Created by webxunmac on 2017/8/23.
//  Copyright © 2017年 RookieHua. All rights reserved.
//

#import "ViewController.h"
#import "RHTitleView.h"
@interface ViewController ()<RHTitleViewDelegate>

@property (nonatomic ,strong) RHTitleView *titleView;
@property (nonatomic ,strong) UILabel *notisLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.notisLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 200, 30)];

    [self.view addSubview:self.notisLabel];
    
    
    self.titleView.delegate = self;
//    self.titleView.defaultFont = 16;
//    self.titleView.selectFont = 30;
//    self.titleView.defaultColor = [UIColor yellowColor];
//    self.titleView.selectColor = [UIColor blueColor];
//    self.titleView.lineH = 5;
    [self.titleView createUIWithTitleArray:@[@"1",@"2",@"3"]];
    [self.titleView defaultSelectTitleIndex:1];
    [self.view addSubview:self.titleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - RhTitleViewDelegate
- (void)titleViewDidClickWithIndex:(NSInteger)index{

    NSLog(@"选中的下标为：%ld",(long)index);
    self.notisLabel.text = [NSString stringWithFormat:@"选中的下标为：%ld",index];
}

#pragma mark - getter
- (RHTitleView *)titleView{
    if (_titleView == nil) {
        _titleView =[[RHTitleView alloc] initWithFrame:CGRectMake(0, 200, 375, 45)];
        _titleView.backgroundColor = [UIColor cyanColor];
 
    }
    return _titleView;
}

@end
