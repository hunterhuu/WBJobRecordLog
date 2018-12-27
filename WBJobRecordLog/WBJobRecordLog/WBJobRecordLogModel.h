//
//  WBJobRecordLogModel.h
//  WBJobRecordLog
//
//  Created by huqi on 2018/12/27.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBJobRecordLogModel : NSObject

@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, strong) NSDictionary *extendParams;

@end
