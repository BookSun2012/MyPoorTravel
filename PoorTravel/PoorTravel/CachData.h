//
//  CachData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"


@interface CachData : NSObject

+ (instancetype)sharedCachData;

- (void)createSqliteData;

- (void)increaeData;

- (void)findData;

- (void)updataData;

- (void)deleateData;

@end
