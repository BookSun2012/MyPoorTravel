//
//  customAppearance.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomAppearance : NSObject

+(instancetype)defaultManager;

- (void)customizeSearchBarAppearance;

- (void)customizeButtonAppearance;

- (void)customizePageControlAppearance;

- (void)customizetoolBarAppearance;

- (void)customizeSegmentedControlAppearance;

- (void)customizeTabBarAppearance;

- (void)customizeNavgationBarAppearance;
@end
