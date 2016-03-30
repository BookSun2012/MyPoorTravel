//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import <UIKit/UIKit.h>
typedef void (^eventBlock)(NSInteger page);

@protocol sendeEventDelegate <NSObject>

- (void)sendEventWithUrl:(NSURL*)url;

@end

@interface DiscountCollectionView : UICollectionView

@property (nonatomic, strong) NSMutableArray *sourceArray;

@property (nonatomic, copy) eventBlock block;

@property (nonatomic, weak) id <sendeEventDelegate>discountDelegate;

- (void)setBlock:(eventBlock)block;
@end
