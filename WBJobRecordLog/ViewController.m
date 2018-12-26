//
//  ViewController.m
//  WBJobRecordLog
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "ViewController.h"
#import "WBJobRecordLog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testMethod];
}

- (void)testMethod {
    [WBJobRecordLogShareInstance readMethod];
    [WBJobRecordLogShareInstance writeMethod];
    NSLog(@"main go go go");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
