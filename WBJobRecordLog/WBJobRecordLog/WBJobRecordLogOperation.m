//
//  WBJobRecordLogOperation.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordLogOperation.h"
#import "WBJobRecordBaseManager.h"

@implementation WBJobRecordLogOperation

#pragma mark - main

- (void)main {
    if (self.handleManager) {
        [self.handleManager invocWithHandelType:self.handleType handleData:self.handleData operationCompletionBlock:self.completionBlock handleCompletionBlock:self.handleCompletionBlock];
        __weak typeof(self) weakSelf = self;
        self.completionBlock = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [strongSelf.handleManager operationDidCompletionHandleType:strongSelf.handleType];
                }];
            }
        };
    }
}

- (void)dealloc {
    
}
#pragma mark - method
@end
