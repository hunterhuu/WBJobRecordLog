//
//  WBJobRecordReadManager.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordReadManager.h"

@interface WBJobRecordReadManager ()

@property (nonatomic, assign) BOOL outData;

@end

@implementation WBJobRecordReadManager

- (void)invocWithHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData {
    [super invocWithHandelType:handleType handleData:handleData];
    switch (handleType) {
        case WBJobRecordLogHandleTypeReadRecordLog:
        {
            [self readRecordLog];
        }
            break;
        default:
            break;
    }
}

- (void)readRecordLog {
    WBJobRecordLog *RL = [self getJobRecordLog];
    if (RL.recordLogOnRAM.count < WBJobRLOnceReadLogNum) {
        [self readFromROM];
    }
    NSInteger index = ((RL.recordLogOnRAM.count < WBJobRLOnceReadLogNum) ? RL.recordLogOnRAM.count : WBJobRLOnceReadLogNum);
    self.completionData = [RL.recordLogOnRAM subarrayWithRange:NSMakeRange(RL.recordLogOnRAM.count - index, index)];
}

- (void)readFromROM {
    
    NSArray <NSString *>*fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:WBJobRLROMFullPath error:nil];
    NSArray <NSString *>*sortedList = [fileList sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        if (obj1.integerValue > obj2.integerValue) {
            return NSOrderedAscending;
        } else if (obj1.integerValue < obj2.integerValue) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    fileList = nil;

    WBJobRecordLog *RL = [self getJobRecordLog];
    if (sortedList && (!self.outData)) {
        for (NSString *fileName in sortedList) {
            if (RL.recordLogOnRAM.count < WBJobRLOnceReadLogNum) {
                NSString *filePath = [NSString stringWithFormat:@"%@/%@", WBJobRLROMFullPath, fileName];
                NSArray *dataArray = [NSArray arrayWithContentsOfFile:filePath];
                if (dataArray) {
                    [RL.recordLogOnRAM addObjectsFromArray:dataArray];
                }
            } else {
                break;
            }
        }
        self.outData = YES;
    }
}
@end
