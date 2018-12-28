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
    [super invocWithHandelType:handleType handleData:handleData];
    switch (handleType) {
        case WBJobRecordLogHandleTypeWriteRecordLog:
        {
            [self writeRecordLogWith:handleData];
        }
            break;
        case WBJobRecordLogHandleTypeWriteOneDozenToROM:
        {
            [self writeRecordLogToROM];
        }
        case WBJobRecordLogHandleTypeWriteAllLogToROM:
        {
            [self writeRecordAllLogToROM];
        }
            break;
        default:
            break;
    }
}

- (void)writeRecordLogWith:(id)data {
    WBJobRecordLog *RL = [self getJobRecordLog];
    if (data && [data isKindOfClass:WBJobRecordLogModel.class]) {
        WBJobRecordLogModel *model = data;
        [RL.recordLogOnRAM addObject:model.WBJobRecordLogFormat];
        [self isNeedWriteDataOnROM];
    }
}

- (void)writeRecordLogToROM {
    WBJobRecordLog *RL = [self getJobRecordLog];
    
    NSMutableArray *needWriteArray = [[NSMutableArray alloc] initWithCapacity:WBJobRLOnceWriteLogNum];
    
    NSInteger minTop = ((RL.recordLogOnRAM.count < WBJobRLOnceWriteLogNum) ? RL.recordLogOnRAM.count : WBJobRLOnceWriteLogNum);
    
    for (NSInteger i = 0; i < minTop; i++) {
        NSString *logFormatString = RL.recordLogOnRAM.firstObject;
        [needWriteArray addObject:logFormatString];
        [RL.recordLogOnRAM removeObject:logFormatString];
    }
    
    [self writeToFileWithArray:needWriteArray];
}

- (void)writeRecordAllLogToROM {
    WBJobRecordLog *RL = [self getJobRecordLog];
    NSMutableArray *needWriteArray = RL.recordLogOnRAM.mutableCopy;
    [RL.recordLogOnRAM removeAllObjects];
    [self writeToFileWithArray:needWriteArray];
}

#pragma mark - needWriteToROM
- (BOOL)isNeedWriteDataOnROM {
    BOOL isNeed = NO;
    WBJobRecordLog *RL = [self getJobRecordLog];
    if (RL.recordLogOnRAM.count >= WBJobRAMMaxNumLog) {
        [RL jobRecordHandelType:WBJobRecordLogHandleTypeWriteOneDozenToROM handleData:nil handleCompletionBlock:nil];
    }
    return isNeed;
}

#pragma mark - writeFile
- (void)writeToFileWithArray:(NSArray *)fileArray {
    if (fileArray.count > 0) {
        NSString *filePath = [NSString stringWithFormat:@"%@/%.0f", WBJobRLROMFullPath, ([NSDate date].timeIntervalSince1970 * 7000)];
//        NSLog(@"filePath = %@", filePath);
        [fileArray writeToFile:filePath atomically:YES];
    }
}
@end
