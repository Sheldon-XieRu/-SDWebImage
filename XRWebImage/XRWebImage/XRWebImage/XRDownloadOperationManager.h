//
//  XRDownloadOperationManager.h
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface XRDownloadOperationManager : NSObject

+ (instancetype)sharedManager;

- (void)downloadWithUrl:(NSString *)url finishedBlock:(void(^)(UIImage *))finishedBlock;

- (void)cancelOperationWithUrl:(NSString *)url;
@end
