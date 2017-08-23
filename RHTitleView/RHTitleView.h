//
//  RHTitleView.h
//  YDTX
//
//  Created by RookieHua on 2017/3/31.
//  Copyright © 2017年 RookieHua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RHTitleViewDelegate <NSObject>

- (void)titleViewDidClickWithIndex:(NSInteger)index;

@end



@interface RHTitleView : UIView
@property (nonatomic,weak) id<RHTitleViewDelegate> delegate;
//可选配置属性
@property (nonatomic,assign) CGFloat defaultFont; //默认字体大小（默认16）
@property (nonatomic,assign) CGFloat selectFont; //选中后的字体大小（默认16）
@property (nonatomic,strong) UIColor *defaultColor;//默认字体颜色（默认lightGrayColor）
@property (nonatomic,strong) UIColor *selectColor;//选中后字体颜色（默认blackColor）
@property (nonatomic,strong) UIColor *lineColor;//下划线颜色（默认红色）
@property (nonatomic,assign) CGFloat lineH;//下划线高度（默认2）
#pragma mark - public methods
/**
 创建视图

 @param titleArray 标题数组（元素为NSString 类型）
 */
- (void)createUIWithTitleArray:(NSArray *)titleArray;


/**
 默认选中下标

 @param Titleindex 选中的下标(注意，下标不能超过你所传的数组下标)，默认选中第0个;
 */
- (void)defaultSelectTitleIndex:(NSInteger)Titleindex;
@end
