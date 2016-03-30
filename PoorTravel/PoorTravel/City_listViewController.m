//
//  City_listViewController.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "City_listViewController.h"
#import "LastCityListCell.h"
#import "HttpEngine.h"
#import "Define.h"
#import "JSONModel.h"
#import "LastCityModel.h"
@interface City_listViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataSocue;
@end

@implementation City_listViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadSouce];
    
}
- (void)creatCollectionView{
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.itemSize = CGSizeMake(170, 260);
    flowLayOut.minimumLineSpacing = 5;
    //每行内部cell item的间距
    flowLayOut.minimumInteritemSpacing = 5;
    //内边距
    flowLayOut.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.footerReferenceSize = CGSizeMake(50, 50);
    
    //附加头视图 大小 水平滚动 宽度有效，高度无效
    flowLayOut.headerReferenceSize = CGSizeMake(20, 30);
    
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 30, self.view.frame.size.width-20,self.view.frame.size.height) collectionViewLayout:flowLayOut];
    [_collectionView registerNib:[UINib nibWithNibName:@"LastCityListCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
  
    _collectionView.bounces = NO;
    _collectionView.delegate   = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
}
- (void)loadSouce {
    _dataSocue = [NSMutableArray array];
    
    HttpEngine *enger = [HttpEngine shareEngine];
    NSString *str = @"###";
    NSRange range = [LastUrl rangeOfString:str];
    
    NSString *tureUrl = [LastUrl stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%@",self.channlID]];
    
    [enger GET:tureUrl parameters:nil success:^(id response) {
        NSError *error = nil;
        _dataSocue = [LastCityModel arrayOfModelsFromDictionaries:response[@"data"] error:&error];
    [self creatCollectionView];
    } failed:^(NSError *error) {
        
        
    }];

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSocue.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LastCityListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    LastCityModel *model = self.dataSocue[indexPath.row];
    [cell configerData:model];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
