//
//  WBJobRecordReadManager.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordReadManager.h"

@interface WBJobRecordReadManager ()

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
    
}

- (void)readFromROM {
    
}

@end
