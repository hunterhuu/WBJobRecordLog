//
//  WBJobRecordReadManager.h
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBJobRecordLog.h"

@interface WBJobRecordReadManager : NSObject

+ (void)readManagerWithHandleType:(WBJobRecordLogHandleType)readHandleType;

@end
