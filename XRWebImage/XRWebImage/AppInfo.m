//
//  AppInfo.m
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo
+ (instancetype)appInfoWithDic:(NSDictionary *)dic {
    AppInfo *appInfo = [[self alloc] init];
    //kvc给属性赋值
    [appInfo setValuesForKeysWithDictionary:dic];
    return appInfo;
}
+ (NSArray *)appInfos{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
    //遍历数组的另一种方式
    [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //字典转模型
        AppInfo *appInfo = [self appInfoWithDic:obj];
        [mArray addObject:appInfo];
    }];
    
    //返回  对可变数组进行copy操作。变成不可变数组
    return mArray.copy;
}
@end
