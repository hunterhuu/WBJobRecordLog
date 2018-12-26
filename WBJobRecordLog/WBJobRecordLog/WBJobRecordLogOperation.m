//
//  WBJobRecordLogOperation.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordLogOperation.h"
#import "WBJobRecordReadManager.h"
#import "WBJobRecordWriteManager.h"

@implementation WBJobRecordLogOperation

#pragma mark - init

+ (instancetype)jobRecordLogOperationWithHandleType:(WBJobRecordLogHandleType)handleType {
    WBJobRecordLogOperation *operation = [[WBJobRecordLogOperation alloc] init];
    operation.handleType = handleType;
    return operation;
}

#pragma mark - main

- (void)main {
    switch (self.handleType) {
        case WBJobRecordLogHandleTypeNull:
        {
                [self WBJobRecordLogHandleTypeNullMethod];
        }
            break;
        case WBJobRecordLogHandleTypeRead0:
        case WBJobRecordLogHandleTypeRead1:
        case WBJobRecordLogHandleTypeRead2:
        case WBJobRecordLogHandleTypeRead3:
        {
            [self WBJobRecordLogHandleTypeReadMethod];
        }
            break;
        case WBJobRecordLogHandleTypeWrite0:
        case WBJobRecordLogHandleTypeWrite1:
        case WBJobRecordLogHandleTypeWrite2:
        case WBJobRecordLogHandleTypeWrite3:
        {
            [self WBJobRecordLogHandleTypeWriteMethod];
        }
            break;
        default:
            break;
    }
    NSLog(@"do something %p", self);
}

- (void)initMethod {
    
}

#pragma mark - method

- (void)WBJobRecordLogHandleTypeNullMethod {
    NSLog(@"null");
}
- (void)WBJobRecordLogHandleTypeReadMethod {
    [WBJobRecordReadManager readManagerWithHandleType:self.handleType];
}
- (void)WBJobRecordLogHandleTypeWriteMethod {
    [WBJobRecordWriteManager writeManagerWithHandleType:self.handleType];
}
@end
