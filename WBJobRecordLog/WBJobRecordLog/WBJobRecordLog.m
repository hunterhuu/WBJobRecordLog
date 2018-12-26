//
//  WBJobRecordLog.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordLog.h"
#import "WBJobRecordLogOperation.h"

@interface WBJobRecordLog ()

@property (nonatomic, strong) NSOperationQueue *WBJobRecordHandleQueue;

@end

@implementation WBJobRecordLog

#pragma mark - init
+ (instancetype)shareInstance {
    static WBJobRecordLog *_shareInstancePointer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstancePointer = [[WBJobRecordLog alloc] init];
    });
    return _shareInstancePointer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initMethod];
    }
    return self;
}

- (void)initMethod {
    self.WBJobRecordHandleQueue = [[NSOperationQueue alloc] init];
    self.WBJobRecordHandleQueue.maxConcurrentOperationCount = 1;
}

#pragma mark - method
- (void)readMethod {
    if (self.WBJobRecordHandleQueue) {
        [self.WBJobRecordHandleQueue addOperation:[WBJobRecordLogOperation jobRecordLogOperationWithHandleType:WBJobRecordLogHandleTypeRead0]];
    }
}
- (void)writeMethod {
    if (self.WBJobRecordHandleQueue) {
        [self.WBJobRecordHandleQueue addOperation:[WBJobRecordLogOperation jobRecordLogOperationWithHandleType:WBJobRecordLogHandleTypeWrite0]];
    }
}

@end
