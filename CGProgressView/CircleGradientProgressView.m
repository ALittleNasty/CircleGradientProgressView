//
//  CircleGradientProgressView.m
//  YYCircleGradientProgressView
//
//  Created by 胡阳 on 16/3/4.
//  Copyright © 2016年 young4ever.com. All rights reserved.
//

#import "CircleGradientProgressView.h"

//把角度转换成PI的方式
#define DegressToRadius(angle) (M_PI*(angle)/180.0f)

static CGFloat const lineWidth = 10.f ;
static CGFloat const animationDuration = 1.5 ;

@interface CircleGradientProgressView ()

{
    CAShapeLayer *maskLayer ; // 蒙版图层
    UILabel      *textLabel ; // 文字label
}

@end

@implementation CircleGradientProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupGradientLayerAndMaskLayer];
        [self setupTextLabel];
    }
    return self ;
}

/**
 *  设置渐变色图层和蒙版图层
 */
- (void)setupGradientLayerAndMaskLayer
{
    // 设置渐变层的颜色变化范围
    CAGradientLayer *layer = [CAGradientLayer layer] ;
    layer.frame = self.bounds ;
    
    // 颜色分配
    layer.colors = @[(__bridge id)[UIColor yellowColor].CGColor,
                     (__bridge id)[UIColor orangeColor].CGColor,
                     (__bridge id)[UIColor cyanColor].CGColor,
                     (__bridge id)[UIColor greenColor].CGColor];
    
    
    // 起始点
    layer.startPoint = CGPointMake(0, 0);
    
    // 结束点
    layer.endPoint   = CGPointMake(1, 0);
    
    [self.layer addSublayer:layer];
    
    CGFloat halfWidth = self.bounds.size.width * 0.5 ;
    CGFloat radius = halfWidth - 10.f;
    CGPoint center = CGPointMake(halfWidth, halfWidth) ;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:DegressToRadius(-90)
                                                      endAngle:DegressToRadius(270)
                                                     clockwise:YES] ;
    
    // 创建蒙板层
    maskLayer = [CAShapeLayer layer] ;
    maskLayer.backgroundColor = [UIColor yellowColor].CGColor;
    maskLayer.lineWidth = lineWidth ;
    maskLayer.lineCap = kCALineCapRound ; // 显得起始点形状<此刻是圆形的>
    maskLayer.strokeStart = 0.0 ;
    maskLayer.strokeEnd = 0.0 ;
    maskLayer.path = [path CGPath];
    maskLayer.fillColor = [UIColor clearColor].CGColor ;
    maskLayer.strokeColor = [UIColor whiteColor].CGColor ;
    [layer setMask:maskLayer];
}
/**
 *  初始化文字labe
 */
- (void)setupTextLabel
{
    textLabel = [[UILabel alloc] init];
    textLabel.frame = self.bounds ;
    textLabel.textColor = [UIColor greenColor] ;
    textLabel.font = [UIFont systemFontOfSize:30.f];
    textLabel.textAlignment = NSTextAlignmentCenter ;
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress * 100] ;
    textLabel.userInteractionEnabled = YES ;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [textLabel addGestureRecognizer:tap];
    [self addSubview:textLabel];
}

/**
 *  设置进度
 */
- (void)setProgress:(CGFloat)progress
{
    CGFloat originalProgress = _progress ;
    _progress = fabs(progress) ;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(originalProgress);
    animation.toValue = @(_progress) ;
    animation.duration = animationDuration ;
    animation.removedOnCompletion = NO ;
    animation.fillMode = kCAFillModeForwards ;
    animation.delegate = self ;
    [maskLayer addAnimation:animation forKey:@"strokeEndAnimation"];
}

/**
 *  动画代理 , 动画执行完毕后改变labe的内容
 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        textLabel.text = [NSString stringWithFormat:@"%.2f%%",_progress * 100] ;
    }
}

/**
 *  label点击事件
 */
- (void)tapAction:(UITapGestureRecognizer *)tapGesture
{
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(labelClickedWithProgress:)]){
        
        [self.delegate labelClickedWithProgress:self.progress];
    }
}

@end
