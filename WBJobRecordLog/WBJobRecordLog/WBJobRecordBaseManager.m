//
//  WBJobRecordBaseManager.m
//  WBJobRecordLog
//
//  Created by huqi on 2018/12/27.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordBaseManager.h"

@implementation WBJobRecordBaseManager

- (instancetype)initWithDelegate:(WBJobRecordLog *)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        NSLog(@"");
    }
    return self;
}

- (void)invocWithHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData {
    self.completionData = nil;
}

- (void)invocWithHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData operationCompletionBlock:(void (^)(void))operationCompletionBlock handleCompletionBlock:(void (^)(id))handleCompletionBlock {
    self.handleCompletionBlock = handleCompletionBlock;
    [self invocWithHandelType:handleType handleData:handleData];
}

- (void)operationDidCompletionHandleType:(WBJobRecordLogHandleType)handleType {
    if (self.handleCompletionBlock) {
        self.handleCompletionBlock(self.completionData);
        self.completionData = nil;
        self.handleCompletionBlock = nil;
    }
}

- (void)handleDidCompletion:(id)completionData {
    
}

- (WBJobRecordLog *)getJobRecordLog {
    if (self.delegate && [self.delegate isKindOfClass:WBJobRecordLog.class]) {
        return (WBJobRecordLog *)self.delegate;
    }
    return nil;
}

@end
