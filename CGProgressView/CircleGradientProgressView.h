//
//  CircleGradientProgressView.h
//  YYCircleGradientProgressView
//
//  Created by 胡阳 on 16/3/4.
//  Copyright © 2016年 young4ever.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CGProgressViewDelegate <NSObject>

/**
 *  label的点击事件代理方法 , 参数为当前进度值
 */
@optional
- (void)labelClickedWithProgress:(CGFloat)progress ;

@end

@interface CircleGradientProgressView : UIView

/**
 *  进度百分比<取值范围: 0.0 ~ 1.0>
 */
@property (nonatomic, assign) CGFloat progress;

/**
 *  代理
 */
@property (nonatomic, weak) id <CGProgressViewDelegate> delegate;

@end
