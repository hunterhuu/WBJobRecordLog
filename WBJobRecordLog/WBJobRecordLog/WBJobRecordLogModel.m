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
        self.time = [NSString stringWithFormat:@"%ld", (long)([NSDate date].timeIntervalSince1970 * 1000)];
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.page = @"detail";
        self.action  = @"enter";
        self.time = [NSString stringWithFormat:@"%ld", (long)([NSDate date].timeIntervalSince1970 * 1000)];
        self.extendParams = @{@"infoid" : @"30523621906346"};
    }
    return self;
}

- (NSString *)WBJobRecordLogFormat {
    return [NSString stringWithFormat:@"%@|%@|%@|%@", self.page, self.action, self.time, [self jsonStringWithDictionary:self.extendParams]];
}

- (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    if (jsonData == nil || error) {
        return nil;
    }
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:NSMakeRange(0, mutStr.length)];
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, mutStr.length)];
    
    return mutStr;
}

@end
