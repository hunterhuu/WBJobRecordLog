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
        case WBJobRecordLogHandleTypeWriteToROM:
        {
            [self writeRecordLogToROM];
        }
            break;
        default:
            break;
    }
}

//- (void)operationDidCompletionHandleType:(WBJobRecordLogHandleType)handleType {
//    if (self.handleCompletionBlock) {
//        self.handleCompletionBlock(self.completionData);
//        self.completionData = nil;
//        self.handleCompletionBlock = nil;
//    }
//}

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
    
    if (needWriteArray.count > 0) {
        NSString *filePath = [NSString stringWithFormat:@"%@/%ld", WBJobRLROMFullPath, (long)([NSDate date].timeIntervalSince1970 * 1000)];
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

@end
