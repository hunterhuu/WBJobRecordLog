//
//  WBJobRecordLogOperation.h
//  textMethod
//
//  Created by huqi on 2018/12/26.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBJobRecordLog.h"
#import "WBJobRecordBaseManager.h"

@interface WBJobRecordLogOperation : NSOperation

@property (nonatomic, assign) WBJobRecordLogHandleType handleType;
@property (nonatomic, strong) id handleData;
@property (nonatomic, strong) WBJobRecordBaseManager *handleManager;
@property (nonatomic, copy) void (^handleCompletionBlock)(id);

@end
