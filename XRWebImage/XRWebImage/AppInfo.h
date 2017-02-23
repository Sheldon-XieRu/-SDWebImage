//
//  AppInfo.h
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *download;

+ (instancetype)appInfoWithDic:(NSDictionary *)dic;


+ (NSArray *)appInfos;
@end
