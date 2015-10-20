//
//  ViewController.m
//  logDemo2
//
//  Created by soppysonny on 15/10/17.
//  Copyright © 2015年 soppysonny. All rights reserved.
//

#import "ViewController.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>


@property (strong, nonatomic)UIImageView *imgView;

@end

@implementation ViewController


- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%s",__func__);
    [super viewDidAppear:animated];
    
    CGPoint bottomOffset = CGPointMake(self.XibScrollView.contentSize.width,0);
    
    //设置单次持续时间
    float scrollDurationInSeconds = 40.0;
    
    //计算timer间隔
    
    
    float totalScrollAmount = bottomOffset.x;
    float timerInterval = scrollDurationInSeconds / totalScrollAmount;
    
    [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(scrollScrollView:) userInfo:nil repeats:YES];
    
}

- (void)scrollScrollView:(NSTimer *)timer
{
   
    CGFloat x = self.XibScrollView.contentOffset.x;
    x+=1;
    self.XibScrollView.contentOffset = CGPointMake(x, 0);
    if (x == self.XibScrollView.contentSize.width) {
        self.XibScrollView.contentOffset = CGPointMake(-SCREENWIDTH , 0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.XibScrollView.backgroundColor = [UIColor greenColor];
    CGPoint bottomOffset = CGPointMake(self.XibScrollView.contentOffset.x, self.XibScrollView.contentSize.height - self.XibScrollView.bounds.size.height);
    [self.XibScrollView setContentOffset:bottomOffset animated:NO];
    self.XibScrollView.delegate =self;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
