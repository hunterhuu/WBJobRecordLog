//
//  WBJobRecordWriteManager.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordWriteManager.h"

@implementation WBJobRecordWriteManager

- (void)invocWithHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData {
    switch (handleType) {
        case WBJobRecordLogHandleTypeWriteRecordLog:
        {
            [self writeRecordLogWith:handleData];
        }
            break;
        case WBJobRecordLogHandleTypeWriteToROM:
        {
            [self writeRecordLogToROM];
        }
            break;
        default:
            break;
    }
}

- (void)operationDidCompletionHandleType:(WBJobRecordLogHandleType)handleType {
    if (self.handleCompletionBlock) {
        self.handleCompletionBlock(@"well done");
        self.handleCompletionBlock = nil;
    }
}

- (void)writeRecordLogWith:(id)data {
    NSLog(@"data = %@", data);
}

- (void)writeRecordLogToROM {
    
}

@end
