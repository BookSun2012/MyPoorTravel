//
//  UIFont+CustomFount.m
//  PoorTravel
//
//  Created by 周书阳 on 16/4/8.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "UIFont+CustomFount.h"

@implementation UIFont (CustomFount)
+(UIFont*) appFontOfSize:(CGFloat) pointSize {
    
    return [UIFont fontWithName:@"MyriadPro-Regular" size:pointSize];
}

+(UIFont*) boldAppFontOfSize:(CGFloat) pointSize {
    
    return [UIFont fontWithName:@"MyriadPro-Black" size:pointSize];
}
@end
