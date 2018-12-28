//
//  WBJobRecordBaseManager.h
//  WBJobRecordLog
//
//  Created by huqi on 2018/12/27.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBJobRecordLog.h"

@interface WBJobRecordBaseManager : NSObject

@property (nonatomic, copy) void (^handleCompletionBlock)(id);
@property (nonatomic, copy) void (^operationCompletionBlock)(void);
@property (nonatomic, weak) WBJobRecordLog* delegate;
@property (nonatomic, strong) id completionData;

- (instancetype)initWithDelegate:(WBJobRecordLog *)delegate;
- (WBJobRecordLog *)getJobRecordLog;

- (void)invocWithHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData;

- (void)invocWithHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData operationCompletionBlock:(void (^)(void))operationCompletionBlock handleCompletionBlock:(void (^)(id))handleCompletionBlock;

- (void)operationDidCompletionHandleType:(WBJobRecordLogHandleType)handleType;

- (void)handleDidCompletion:(id)completionData;
@end
