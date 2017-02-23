//
//  XRDownloadOperationManager.m
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "XRDownloadOperationManager.h"
#import "XRDownloadOperation.h"
#import "NSString+imageSavePath.h"

@interface XRDownloadOperationManager()

@property (nonatomic,strong) NSOperationQueue *queue;

@property (nonatomic,strong) NSMutableDictionary *imageCache;
@property (nonatomic,strong) NSMutableDictionary *operationCache;


@end


@implementation XRDownloadOperationManager




+ (instancetype)sharedManager {
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [XRDownloadOperationManager new];
    });
    return instance;
}



- (void)downloadWithUrl:(NSString *)url finishedBlock:(void (^)(UIImage *))finishedBlock{
    
    NSAssert(finishedBlock, @"必须要有finishBlock");
    
    if (self.operationCache[url]) {
        return;
    }
    
    //判断图片是否有缓存
    if ([self checkImageCache:url]) {
        UIImage *image = self.imageCache[url];
        finishedBlock(image);
        return;
    }
    
    //下载
    XRDownloadOperation *operation = [XRDownloadOperation operationWithUrl:url finishBlock:^(UIImage *image) {
        
        self.imageCache[url] = image;
        [self.operationCache removeObjectForKey:url];
        finishedBlock(image);
    }];
    
    [self.queue addOperation:operation];
    self.operationCache[url] = operation;
    
    
}

- (void)cancelOperationWithUrl:(NSString *)url {
    if (url == nil) {
        return;
    }
    if (self.operationCache[url]) {
        [self.operationCache[url] cancel];
        [self.operationCache removeObjectForKey:url];
    }
}


- (BOOL)checkImageCache:(NSString *)url{
    if (self.imageCache[url]) {
        return YES;
    }
    
    UIImage *img = [UIImage imageWithContentsOfFile:[url saveCachePath]];
    if (img) {
        self.imageCache[url] = img;
        return YES;
    }
    return NO;
    
}


- (NSOperationQueue *)queue{
    if (_queue == nil) {
        _queue = [NSOperationQueue new];
        _queue.maxConcurrentOperationCount = 5;
    }
    return _queue;
}

- (NSMutableDictionary *)imageCache{
    if (_imageCache == nil) {
        _imageCache = [NSMutableDictionary new];
    }
    return _imageCache;
}

- (NSMutableDictionary *)operationCache {
    if (_operationCache == nil) {
        _operationCache = [NSMutableDictionary new];
    }
    return _operationCache;
}

@end
