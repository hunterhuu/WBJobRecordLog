//
//  WBJobRecordLog.m
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordLog.h"
#import "WBJobRecordLogOperation.h"
#import "WBJobRecordReadManager.h"
#import "WBJobRecordWriteManager.h"

@interface WBJobRecordLog ()

@property (nonatomic, strong) NSOperationQueue *WBJobRecordHandleQueue;
@property (nonatomic, strong) WBJobRecordReadManager *readManager;
@property (nonatomic, strong) WBJobRecordWriteManager *writeManager;

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
    self.readManager = [[WBJobRecordReadManager alloc] initWithDelegate:self];
    self.writeManager = [[WBJobRecordWriteManager alloc] initWithDelegate:self];
}

#pragma mark - method
- (void)jobRecordHandelType:(WBJobRecordLogHandleType)handleType{
    if (self.WBJobRecordHandleQueue) {
        WBJobRecordLogOperation *operation = [WBJobRecordLogOperation jobRecordLogOperationWithHandleType:0];
        operation.completionBlock = ^{
            NSLog(@"gogogo");
        };
        [self.WBJobRecordHandleQueue addOperation:operation];
    }
}


@end
