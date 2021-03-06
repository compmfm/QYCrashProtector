//
//  Test.m
//  QYCrashProtector
//
//  Created by Zhi Zhuang on 2017/9/13.
//  Copyright © 2017年 qiye. All rights reserved.
//

#import "Test.h"
#import "NSObject+CrashProtector.h"

@implementation Test
{
    NSTimer * timer;
}

-(void)doTimerTest
{
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(testLog) userInfo:nil repeats:YES];
}

-(void)doNotificationTest
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCallback) name:@"notificationCallback_test" object:nil];
    
    self.kvo_name = @"ccccccc";
}

-(void)notificationCallback
{
    NSLog(@"%s",__func__);
}

-(void)testLog
{
    NSLog(@"Test:%s",__func__);
}

-(void)dealloc
{
    NSLog(@"Test class is dealloc!");
    [self removeObserver:self forKeyPath:@"kvo_name"];
}


-(void)testKVO
{
    [self addObserver:self forKeyPath:@"kvo_name" options:NSKeyValueObservingOptionNew context:nil];
    self.kvo_name = @"66666";
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    NSLog(@"observeValueForKeyPath:%@",keyPath);
}

@end
