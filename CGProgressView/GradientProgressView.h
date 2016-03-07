//
//  GradientProgressView.h
//  YYCircleGradientProgressView
//
//  Created by 胡阳 on 16/3/7.
//  Copyright © 2016年 young4ever.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientProgressView : UIView

/**
 *  快速创建一个渐变色的View
 *
 *  @param frame 位置
 *  @param array 颜色数组
 *
 *  @return GradientProgressView
 */
- (instancetype)initWithFrame:(CGRect)frame andColors:(NSArray *)colors ;

@end
