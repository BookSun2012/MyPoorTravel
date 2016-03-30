//
//  HotCollectionView.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSMutableArray *hotCityDataSouce;
@end
