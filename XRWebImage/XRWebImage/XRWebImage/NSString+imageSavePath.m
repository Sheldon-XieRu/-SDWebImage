//
//  NSString+imageSavePath.m
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "NSString+imageSavePath.h"

@implementation NSString (imageSavePath)
- (NSString *)saveCachePath {
    return  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingString:self.lastPathComponent];
}

//- (NSString *)saveDocumentPath:(NSString *)url;
//- (NSString *)saveTempPath:(NSString *)url;
@end
