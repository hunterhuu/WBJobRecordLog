//
//  WBJobRecordWriteManager.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordWriteManager.h"

@implementation WBJobRecordWriteManager

+ (void)writeManagerWithHandleType:(WBJobRecordLogHandleType)writeHandleType {
//    WBJobRecordWriteManager *manager = [[WBJobRecordWriteManager alloc] init];
    switch (writeHandleType) {
        case WBJobRecordLogHandleTypeWrite0:
        {
            [self write0];
        }
            break;
        case WBJobRecordLogHandleTypeWrite1:
        {
            [self write1];
        }
            break;
        case WBJobRecordLogHandleTypeWrite2:
        {
            [self write2];
        }
            break;
        case WBJobRecordLogHandleTypeWrite3:
        {
            [self write3];
        }
            break;
        default:
            break;
    }
}

+ (void)write0 {
    NSLog(@"write0");
}
+ (void)write1 {
    NSLog(@"write1");
}
+ (void)write2 {
    NSLog(@"write2");
}
+ (void)write3 {
    NSLog(@"write3");
}
@end
