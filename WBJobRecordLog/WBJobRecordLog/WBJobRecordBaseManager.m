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
    
}

- (void)invocWithHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData operationCompletionBlock:(void (^)(void))operationCompletionBlock handleCompletionBlock:(void (^)(id))handleCompletionBlock {
    self.handleCompletionBlock = handleCompletionBlock;
    [self invocWithHandelType:handleType handleData:handleData];
}

- (void)operationDidCompletionHandleType:(WBJobRecordLogHandleType)handleType {

}

- (void)handleDidCompletion:(id)completionData {
    
}
@end
