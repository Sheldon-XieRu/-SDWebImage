//
//  NSString+imageSavePath.h
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (imageSavePath)
- (NSString *)saveCachePath;
- (NSString *)saveDocumentPath;
- (NSString *)saveTempPath;
@end
