//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef void (^successed)(id response);
typedef void (^field)(id error);

@interface LoadNetData : NSObject

+ (instancetype)sharedLoadNetData;

- (void)loadNetDataWithUrl:(NSString*)url success:(successed)successed filed:(field)field;

- (void)laodNetDataByPostUrl:(NSString *)url para:(NSDictionary*)para success:(successed)successed filed:(field)field;

@end
