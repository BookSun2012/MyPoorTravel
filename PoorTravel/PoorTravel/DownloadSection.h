//
//  DownloadSection.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadSection : NSObject



+ (instancetype)sharedDownloadSection;

- (void)startDownloadWithUrl:(NSString*)url;

- (void)cancleDownLoadWithUrl;

@end
