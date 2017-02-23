//
//  XRDownloadOperation.h
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface XRDownloadOperation : NSOperation


@property (nonatomic,copy) NSString *url;

@property (nonatomic,copy) void (^finishBlock)(UIImage *image);

+ (instancetype)operationWithUrl:(NSString *)url finishBlock:(void(^)(UIImage *image))finishBlock;

@end
