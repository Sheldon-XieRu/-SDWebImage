//
//  UIImageView+extension.m
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "UIImageView+extension.h"
#import <objc/runtime.h>
#import "XRDownloadOperationManager.h"

const char *key;
@interface UIImageView()



@property (nonatomic,copy) NSString *currentUrl;
@end

@implementation UIImageView (extension)


- (NSString *)currentUrl {
    return  objc_getAssociatedObject(self, key);
}

- (void)setCurrentUrl:(NSString *)currentUrl {
    objc_setAssociatedObject(self, key, currentUrl, OBJC_ASSOCIATION_COPY);
}




- (void)xr_setImageUrl:(NSString *)url {
    
    if (![self.currentUrl isEqualToString:url]) {
        //取消操作
        [[XRDownloadOperationManager sharedManager]cancelOperationWithUrl:self.currentUrl];
        
    }
    
    self.currentUrl = url;
    [[XRDownloadOperationManager sharedManager]downloadWithUrl:url finishedBlock:^(UIImage *image) {
       
        self.image = image;
        
    }];
    
    
    
}
@end
