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
        self.handleCompletionBlock(self.completionData);
        self.completionData = nil;
        self.handleCompletionBlock = nil;
    }
}

- (void)writeRecordLogWith:(id)data {
    WBJobRecordLog *RL = [self getJobRecordLog];
    [RL.recordLogOnRAM addObject:data];
    [self isNeedWriteDataOnROM];
}

- (void)writeRecordLogToROM {
    WBJobRecordLog *RL = [self getJobRecordLog];
    

}


#pragma mark - needWriteToROM
- (BOOL)isNeedWriteDataOnROM {
    BOOL isNeed = NO;
    WBJobRecordLog *RL = [self getJobRecordLog];
    if (RL.recordLogOnRAM.count >= RAMMaxNumLog) {
        [RL jobRecordHandelType:WBJobRecordLogHandleTypeWriteToROM handleData:nil handleCompletionBlock:nil];
    }
    return isNeed;
}

- (WBJobRecordLog *)getJobRecordLog {
    if (self.delegate && [self.delegate isKindOfClass:WBJobRecordLog.class]) {
        return (WBJobRecordLog *)self.delegate;
    }
    return nil;
}

@end
