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
    NSLog(@"do something %p", self);
}

- (void)initMethod {
    
}

#pragma mark - method

- (void)WBJobRecordLogHandleTypeNullMethod {

}
- (void)WBJobRecordLogHandleTypeReadMethod {

}
- (void)WBJobRecordLogHandleTypeWriteMethod {

}
@end
