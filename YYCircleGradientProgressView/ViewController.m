//
//  ViewController.m
//  YYCircleGradientProgressView
//
//  Created by 胡阳 on 16/3/4.
//  Copyright © 2016年 young4ever.com. All rights reserved.
//

#import "ViewController.h"
#import "CircleGradientProgressView.h"
#import "GradientProgressView.h"

@interface ViewController ()<CGProgressViewDelegate>

@property (nonatomic, strong) CircleGradientProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.stepper.continuous = YES ;
    self.stepper.autorepeat = NO ;
    self.stepper.value = 0.0 ;
    self.stepper.minimumValue = 0.0 ;
    self.stepper.maximumValue = 1.0 ;
    self.stepper.stepValue = 0.2 ;
    
    
    self.progressView = [[CircleGradientProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.progressView.delegate = self;
    [self.view addSubview:self.progressView];
    
    NSArray *colors = @[(__bridge id)[UIColor yellowColor].CGColor,
                        (__bridge id)[UIColor orangeColor].CGColor] ;
    GradientProgressView *proView = [[GradientProgressView alloc] initWithFrame:CGRectMake(100, 320, 200, 10) andColors:colors];
    [self.view addSubview:proView];
}
- (IBAction)stepAction:(UIStepper *)sender
{
    CGFloat progress = sender.value ;
    
    self.progressView.progress = progress ;
}


- (void)labelClickedWithProgress:(CGFloat)progress
{
    NSLog(@"当前进度是: %.2f",progress) ;
}

@end
