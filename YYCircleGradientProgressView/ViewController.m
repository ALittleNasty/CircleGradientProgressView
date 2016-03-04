//
//  ViewController.m
//  YYCircleGradientProgressView
//
//  Created by 胡阳 on 16/3/4.
//  Copyright © 2016年 young4ever.com. All rights reserved.
//

#import "ViewController.h"
#import "CircleGradientProgressView.h"

@interface ViewController ()<CGProgressViewDelegate>

@property (nonatomic, strong) CircleGradientProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.progressView = [[CircleGradientProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.progressView.delegate = self;
    [self.view addSubview:self.progressView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    static CGFloat progress = 0.0 ;
    
    progress += 0.2 ;
    
    self.progressView.progress = progress ;
}

- (void)labelClickedWithProgress:(CGFloat)progress
{
    NSLog(@"当前进度是: %.2f",progress) ;
}

@end
