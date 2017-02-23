//
//  XRDownloadOperation.m
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "XRDownloadOperation.h"
#import "NSString+imageSavePath.h"

@implementation XRDownloadOperation


+ (instancetype)operationWithUrl:(NSString *)url finishBlock:(void (^)(UIImage *))finishBlock{
    XRDownloadOperation *op = [self new];
    op.url = url;
    op.finishBlock = finishBlock;
    return op;
}


- (void)main {
    @autoreleasepool {
        
        NSAssert(self.finishBlock != nil, @"finishblock 不能为空");
        
        [NSThread sleepForTimeInterval:2.0];
    
        NSURL *url = [NSURL URLWithString:self.url];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        if (image) {
            [data writeToFile:[self.url saveCachePath] atomically:YES];
        }
        
        if (self.isCancelled) {
            return;
        }
        
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            self.finishBlock(image);
        }];
        
        
    }
}





@end
