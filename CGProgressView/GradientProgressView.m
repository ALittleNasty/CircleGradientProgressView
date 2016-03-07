//
//  GradientProgressView.m
//  YYCircleGradientProgressView
//
//  Created by 胡阳 on 16/3/7.
//  Copyright © 2016年 young4ever.com. All rights reserved.
//

#import "GradientProgressView.h"

@implementation GradientProgressView


- (instancetype)initWithFrame:(CGRect)frame andColors:(NSArray *)colors
{
    self = [super initWithFrame:frame] ;
    if (self) {
       
        self.clipsToBounds = YES ;
        self.layer.cornerRadius = self.bounds.size.height * 0.5 ;
        
        [self setupGradientLayerWithColors:colors];
    }
    
    return self ;
}

- (void)setupGradientLayerWithColors:(NSArray *)colors
{
    // 设置渐变层的颜色变化范围
    CAGradientLayer *layer = [CAGradientLayer layer] ;
    layer.frame = self.bounds ;
    
    // 颜色分配
    layer.colors = colors ;
    
    
    // 起始点
    layer.startPoint = CGPointMake(0, 0);
    
    // 结束点
    layer.endPoint   = CGPointMake(1, 0);
    
    [self.layer addSublayer:layer];
}

@end
