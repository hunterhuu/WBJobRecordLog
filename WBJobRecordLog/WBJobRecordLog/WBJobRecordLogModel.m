//
//  WBJobRecordLogModel.m
//  WBJobRecordLog
//
//  Created by huqi on 2018/12/27.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WBJobRecordLogModel.h"

@implementation WBJobRecordLogModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.time = [NSString stringWithFormat:@"%f", [NSDate date].timeIntervalSince1970];
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.page = @"detail";
        self.action  = @"enter";
        self.time = [NSString stringWithFormat:@"%f", [NSDate date].timeIntervalSince1970];
    }
    return self;
}

@end
