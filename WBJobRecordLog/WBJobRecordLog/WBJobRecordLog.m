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
#import "AppDelegate.h"

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
    [self checkDIR];
    self.WBJobRecordHandleQueue = [[NSOperationQueue alloc] init];
    self.WBJobRecordHandleQueue.maxConcurrentOperationCount = 1;
    self.recordLogOnRAM = [[NSMutableArray alloc] initWithCapacity:40];
    self.readManager = [[WBJobRecordReadManager alloc] initWithDelegate:self];
    self.writeManager = [[WBJobRecordWriteManager alloc] initWithDelegate:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)applicationDidEnterBackground {
    [self jobRecordHandelType:WBJobRecordLogHandleTypeWriteAllLogToROM handleData:nil handleCompletionBlock:nil];
}

- (void)checkDIR {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"WBJobRLDIR = %@", WBJobRLROMFullPath);
    if (![fileManager fileExistsAtPath:WBJobRLROMFullPath]) {
        [fileManager createDirectoryAtPath:WBJobRLROMFullPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

#pragma mark - method
- (void)jobRecordHandelType:(WBJobRecordLogHandleType)handleType handleData:(id)handleData handleCompletionBlock:(void (^)(id completionData))handleCompletionBlock {
    if (self.WBJobRecordHandleQueue) {
        WBJobRecordLogOperation *operation = [[WBJobRecordLogOperation alloc] init];
        operation.handleType = handleType;
        operation.handleData = handleData;
        operation.handleManager = [self registedManagerWith:handleType];
        operation.handleCompletionBlock = handleCompletionBlock;
        [self.WBJobRecordHandleQueue addOperation:operation];
    }
}

#pragma mark - regist handletype&manager
- (WBJobRecordBaseManager *)registedManagerWith:(WBJobRecordLogHandleType)handleType {
    WBJobRecordBaseManager *handleManager = nil;
    switch (handleType) {
        case WBJobRecordLogHandleTypeNull:
            {
                handleManager = [[WBJobRecordBaseManager alloc] init];
            }
            break;
        case WBJobRecordLogHandleTypeWriteRecordLog:
        case WBJobRecordLogHandleTypeWriteOneDozenToROM:
        case WBJobRecordLogHandleTypeWriteAllLogToROM:
        {
            handleManager = self.writeManager;
        }
            break;
        case WBJobRecordLogHandleTypeReadRecordLog:
        {
            handleManager = self.readManager;
        }
            break;
        default:
        {
            handleManager = [[WBJobRecordBaseManager alloc] init];
        }
            break;
    }
    return handleManager;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
