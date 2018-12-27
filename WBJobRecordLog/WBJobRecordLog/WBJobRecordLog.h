//
//  WBJobRecordLog.h
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBJobRecordLogModel.h"

#define WBJobRecordLogShareInstance [WBJobRecordLog shareInstance]
#define RAMMaxNumLog 2
#define RLCachePath (NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject)
#define RLDIR (@"WBJobRecordLogDir");
#define RLROMFullPath [NSString stringWithFormat:@"%@/%@", RLCachePath, RLDIR];
typedef NS_ENUM(NSInteger, WBJobRecordLogHandleType) {
    WBJobRecordLogHandleTypeNull = 0,
    WBJobRecordLogHandleTypeWriteRecordLog,     //记录日志
    WBJobRecordLogHandleTypeWriteToROM,         //写到硬盘
    WBJobRecordLogHandleTypeReadRecordLog,      //读取数据
    WBJobRecordLogHandleTypeReadFromROM         //从硬盘读取数据
};

@interface WBJobRecordLog : NSObject

@property (nonatomic, strong) NSMutableArray <WBJobRecordLogModel *>*recordLogOnRAM;

+ (instancetype)shareInstance;
- (void)jobRecordHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData handleCompletionBlock:(void (^)(id))handleCompletionBlock;
@end
