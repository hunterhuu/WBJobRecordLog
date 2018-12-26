//
//  WBJobRecordReadManager.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordReadManager.h"

@implementation WBJobRecordReadManager

+ (void)readManagerWithHandleType:(WBJobRecordLogHandleType)readHandleType {
//    WBJobRecordReadManager *manager = [[WBJobRecordReadManager alloc] init];
    switch (readHandleType) {
        case WBJobRecordLogHandleTypeRead0:
        {
            [self read0];
        }
            break;
        case WBJobRecordLogHandleTypeRead1:
        {
            [self read1];
        }
            break;
        case WBJobRecordLogHandleTypeRead2:
        {
            [self read2];
        }
            break;
        case WBJobRecordLogHandleTypeRead3:
        {
            [self read3];
        }
            break;
        default:
            break;
    }
}

+ (void)read0 {
    NSLog(@"read0");
}
+ (void)read1 {
    NSLog(@"read1");
}
+ (void)read2 {
    NSLog(@"read2");
}
+ (void)read3 {
    NSLog(@"read3");
}
@end
