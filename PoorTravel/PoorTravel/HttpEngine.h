//
//  HttpEngine.h
//  LimitFreeApp
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
//成功的回调Block
typedef void (^SuccessBlockType)(id response);
//失败的回调Block
typedef void(^FailedBlockType) (NSError *error);


@interface HttpEngine : NSObject

//公开方法
+ (instancetype)shareEngine;

- (void)GET:(NSString *)URLString parameters:(id)parameter  success:(SuccessBlockType)success failed:(FailedBlockType)failed;


@end
