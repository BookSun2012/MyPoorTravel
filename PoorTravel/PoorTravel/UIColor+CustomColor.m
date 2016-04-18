//
//  UIColor+CustomColor.m
//  PoorTravel
//
//  Created by 周书阳 on 16/4/8.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "UIColor+CustomColor.h"

@implementation UIColor (CustomColor)
#define GREY(color) [UIColor colorWithRed:color/255.0 green:color/255.0 blue:color/255.0 alpha:1]

+(UIColor*)appBackgroundColor{
    
    return [UIColor whiteColor];
}

+(UIColor*) appBlack1Color {
    
    return GREY(38);
}

+(UIColor*) appOffWhiteColor {
    
    return GREY(234);
}
@end
