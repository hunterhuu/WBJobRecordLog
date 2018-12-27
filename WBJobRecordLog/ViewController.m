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
    
    
    
    
    UIButton *buttonRed = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 50, 50)];
    buttonRed.backgroundColor = UIColor.redColor;
    [buttonRed addTarget:self action:@selector(buttonRedClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonRed];
    
    UIButton *buttonGreen = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
    buttonGreen.backgroundColor = UIColor.greenColor;
    [buttonGreen addTarget:self action:@selector(buttonGreenClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonGreen];
}

- (void)buttonRedClick {
    WBJobRecordLogModel *model = [[WBJobRecordLogModel alloc] init];
    model.page = @"detail";
    model.action = @"enter";
    model.extendParams = @{@"infoid" : @"30523621906346"};
    [WBJobRecordLogShareInstance jobRecordHandelType:WBJobRecordLogHandleTypeWriteRecordLog handleData:model handleCompletionBlock:nil];
}

- (void)buttonGreenClick {
    [WBJobRecordLogShareInstance jobRecordHandelType:WBJobRecordLogHandleTypeReadRecordLog handleData:nil handleCompletionBlock:^(id completionData) {
        NSLog(@"completionData = %@", completionData);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
