//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import <UIKit/UIKit.h>
#import "IdeaModel.h"


typedef void (^nextPage)(NSString *url,NSString *guides_id);

@interface RightCollectionView : UICollectionView

@property (nonatomic, strong) IdeaModel *model;

@property (nonatomic, copy) nextPage next;




- (void)setNext:(nextPage)next;


@end
