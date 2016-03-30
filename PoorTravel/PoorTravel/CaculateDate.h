//
//  CaculateDate.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//此类为工具类


@interface CaculateDate : UIViewController

/**
 *  算时间
 */
+ (NSString*)caculateDataWithSecond:(NSInteger)second;

/**
 *  算高度
 */

+ (CGSize)caculateSizeWithString:(NSString*)text;

@end
