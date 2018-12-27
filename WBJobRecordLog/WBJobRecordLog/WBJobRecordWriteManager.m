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
    
    NSMutableArray *needWriteArray = [[NSMutableArray alloc] initWithCapacity:WBJobRLOnceWriteLogNum];
    
    NSInteger i = 0;
    if (RL.recordLogOnRAM.count >= WBJobRLOnceWriteLogNum) {
        i = RL.recordLogOnRAM.count - WBJobRLOnceWriteLogNum;
    } else {
        i = 0;
    }
    for (; i < RL.recordLogOnRAM.count; i++) {
        WBJobRecordLogModel *model = RL.recordLogOnRAM[i];
        [needWriteArray addObject:model.WBJobRecordLogFormat];
        [RL.recordLogOnRAM removeObject:model];
    }
    if (needWriteArray.count > 0) {
        NSString *filePath = [NSString stringWithFormat:@"%@/%ld", WBJobRLROMFullPath, (long)[NSDate date].timeIntervalSince1970];
        NSLog(@"filePath = %@", filePath);
        [needWriteArray writeToFile:filePath atomically:YES];
    }
}


#pragma mark - needWriteToROM
- (BOOL)isNeedWriteDataOnROM {
    BOOL isNeed = NO;
    WBJobRecordLog *RL = [self getJobRecordLog];
    if (RL.recordLogOnRAM.count >= WBJobRAMMaxNumLog) {
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
