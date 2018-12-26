//
//  WBJobRecordLog.h
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WBJobRecordLogShareInstance [WBJobRecordLog shareInstance]

typedef NS_ENUM(NSInteger, WBJobRecordLogHandleType) {
    WBJobRecordLogHandleTypeNull = 0,
    WBJobRecordLogHandleTypeRead0,
    WBJobRecordLogHandleTypeRead1,
    WBJobRecordLogHandleTypeRead2,
    WBJobRecordLogHandleTypeRead3,
    WBJobRecordLogHandleTypeWrite0,
    WBJobRecordLogHandleTypeWrite1,
    WBJobRecordLogHandleTypeWrite2,
    WBJobRecordLogHandleTypeWrite3
};

@interface WBJobRecordLog : NSObject

+ (instancetype)shareInstance;

- (void)readMethod;
- (void)writeMethod;

@end
