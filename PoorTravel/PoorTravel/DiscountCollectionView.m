//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "DiscountCollectionView.h"
#import "DiscountCollectionViewCell.h"
#import "DiscountModel.h"

@interface DiscountCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>



@end
@implementation DiscountCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        
        _sourceArray = [NSMutableArray array];
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerNib:[UINib nibWithNibName:@"DiscountCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.sourceArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    DiscountCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    DiscountLastminutes *last = self.sourceArray[indexPath.row];
    [cell configData:last];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DiscountLastminutes *model  = self.sourceArray[indexPath.row];
    NSString *str = model.url;
    NSURL *url = [NSURL URLWithString:str];
    if (self.discountDelegate && [self.discountDelegate respondsToSelector:@selector(sendEventWithUrl:)]) {

        [self.discountDelegate sendEventWithUrl:url];
    }
}


static NSInteger page = 1;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    CGFloat temp = scrollView.contentSize.height;
   
    if (scrollView.contentOffset.y * 1.5 >= temp) {
        page++;
        if (self.block) {
            self.block(page);
        }
    }
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
