//
//  VideoViewController.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "VideoViewController.h"
#import "Masonry.h"
#import "TheHotPlaceCollectionViewController.h"
#import "HttpEngine.h"
#import "Define.h"
#import "FirstModel.h"
#import "HotCityCell.h"
#import "DetailViewController.h"
#import "ZSY_Factory.h"
@interface VideoViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataSocue;
@property (nonatomic,strong)NSMutableArray *titleSouce;
@property (nonatomic,strong)NSMutableArray *da;
@property (nonatomic,strong)NSMutableArray *db;
@property (nonatomic,strong)NSMutableArray *hotCountrySouce;
@property (nonatomic,strong)UIImageView *mapView;
@property (nonatomic,strong)NSString *mytitle;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creaScrollView];
    [self loadDataSouce];
    self.title = @"目的地";
    self.edgesForExtendedLayout = NO;
}
- (void)creaScrollView{
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _scrollView.bounces = NO;
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.height.mas_equalTo(self.view.frame.size.height);
    }];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    NSLog(@"%f %f",_scrollView.contentSize.width,_scrollView.contentSize.height);;
    [self creatMapView];
}

- (void)creatMapView{
    _mapView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"map"]];
    _mapView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    _mapView.userInteractionEnabled = YES;
    [_scrollView addSubview:_mapView];
    
}

- (void)loadDataSouce {
    _dataSocue = [NSMutableArray array];
    _titleSouce = [NSMutableArray array];
    _da = [NSMutableArray array];
    _db = [NSMutableArray array];
    HttpEngine *enger = [HttpEngine shareEngine];
    [enger GET:URL parameters:nil success:^(id response) {
        NSError *error= nil;

        
        self.dataSocue = [DataModel arrayOfModelsFromDictionaries:response[@"data"] error:&error];

        
        for (int i=0; i<self.dataSocue.count; i++) {
            DataModel *model = self.dataSocue[i];
            [_titleSouce addObject:model.cnname];
        }
        NSArray *arr = response[@"data"];
        for (NSDictionary *dic  in arr) {
            [_da addObject:[Hot_CountryModel  arrayOfModelsFromDictionaries:dic[@"hot_country"] error:nil]];
            [_db addObject:[CountryModel arrayOfModelsFromDictionaries:dic[@"country"] error:nil]];
            }
        
        self.hotCountrySouce = self.da[0];
        [self creatButn];
        [self creatCollection];
    } failed:^(NSError *error) {
        
    }];

    
    
}
- (void)creatButn {
    for (int i=0; i<self.titleSouce.count; i++) {
        UIButton *butn = [UIButton buttonWithType:UIButtonTypeCustom];
        butn.frame = CGRectMake(self.view.frame.size.width/7*i, 170, self.view.frame.size.width/7, 30);
        [butn setBackgroundColor:[UIColor grayColor]];
        [butn setTitle:_titleSouce[i] forState:UIControlStateNormal];
        butn.titleLabel.font = [UIFont systemFontOfSize:12 weight:2];
        butn.titleLabel.textColor = [UIColor orangeColor];
        butn.tag = 200+i;
        [butn addTarget:self action:@selector(butnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.mapView addSubview:butn];
    }
    
    [ZSY_Factory buttonWithFrame:CGRectMake(285, 55, 50, 20) Type:UIButtonTypeCustom Title:@"亚洲" fontSize:15 titleColor:[UIColor redColor] bgColor:nil target:self selector:@selector(butnPress:) layer:5 tag:200 supperView:self.mapView];
    
    
    _mytitle = @"亚洲";
}


- (void)butnPress:(UIButton *)butn{
    switch (butn.tag) {
        case 200:
     
             [self.collectionView removeFromSuperview];
            self.hotCountrySouce = self.da[0];
            [self.collectionView reloadData];
            _mytitle = butn.titleLabel.text;
            [self creatCollection];
            _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.3);
//            NSLog(@"%f %f",_scrollView.contentSize.width,_scrollView.contentSize.height);
//             NSLog(@"%f %f",self.collectionView.frame.size.width,self.collectionView.frame.size.height);
            break;
        case 201:
     
             [self.collectionView removeFromSuperview];
            self.hotCountrySouce = self.da[1];
            [self.collectionView reloadData];
            _mytitle = butn.titleLabel.text;
             [self creatCollection];
            _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.3);
            break;
        case 202:
  
           [self.collectionView removeFromSuperview];
            self.hotCountrySouce = self.da[2];
            [self.collectionView reloadData];
            _mytitle = butn.titleLabel.text;
            [self creatCollection];
            _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.3);
            break;
        case 203:
      
        [self.collectionView removeFromSuperview];
            self.hotCountrySouce = self.da[3];
            [self.collectionView reloadData];
            _mytitle = butn.titleLabel.text;
            [self creatCollection];
            _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.3);
            break;
        case 204:
          
           [self.collectionView removeFromSuperview];
            self.hotCountrySouce = self.da[4];
            [self.collectionView reloadData];
            _mytitle = butn.titleLabel.text;
            [self creatCollection];
            _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.3);
            break;
        case 205:
          
         [self.collectionView removeFromSuperview];
            self.hotCountrySouce = self.da[5];
            [self.collectionView reloadData];
            _mytitle = butn.titleLabel.text;
             [self creatCollection];
//             NSLog(@"%f %f",self.collectionView.frame.size.width,self.collectionView.frame.size.height);
            _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.3);
            break;
        case 206:
           
            [self.collectionView removeFromSuperview];
            self.hotCountrySouce = self.da[6];
            [self.collectionView reloadData];
            _mytitle = butn.titleLabel.text;
            
            [self creatCollection];
            _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
//             NSLog(@"%f %f",_scrollView.contentSize.width,_scrollView.contentSize.height);
//            NSLog(@"%f %f",self.collectionView.frame.size.width,self.collectionView.frame.size.height);
            break;
        default:
            break;
    }
}
#pragma mark CollectionView

- (void)creatCollection{
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.itemSize = CGSizeMake(160, 220);
    flowLayOut.minimumLineSpacing = 20;
    //每行内部cell item的间距
    flowLayOut.minimumInteritemSpacing = 5;
    //内边距
    flowLayOut.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.footerReferenceSize = CGSizeMake(50, 50);
    
    
    //附加头视图 大小 水平滚动 宽度有效，高度无效
    flowLayOut.headerReferenceSize = CGSizeMake(50, 50);
    //附加尾视图 大小 垂直滚动 高度有效，宽度无效
    flowLayOut.footerReferenceSize = CGSizeMake(50, 50);
    
    
    if (self.hotCountrySouce.count==1) {
    _collectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 280) collectionViewLayout:flowLayOut];
    }else{
    _collectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 270*self.hotCountrySouce.count/2) collectionViewLayout:flowLayOut];
    }
    
    

    _collectionView.backgroundColor = [UIColor orangeColor];
    _collectionView.scrollEnabled = NO;
    
    
    
    
    //注册头尾视图
    //注册头视图
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID"];
    //注册尾视图
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footID"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HotCityCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    _collectionView.delegate = self;
    
    
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:_collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hotCountrySouce.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotCityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    Hot_CountryModel *model = self.hotCountrySouce[indexPath.row];
    [cell configerData:model];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   DetailViewController  *detailVC = [[DetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    Hot_CountryModel *model = self.hotCountrySouce[indexPath.row];
    detailVC.hotCityName = model.cnname;
    detailVC.channleID   = model.id;
    
    
}
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *suppView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //说明是要我们返回头视图
        
        suppView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID" forIndexPath:indexPath ];
        suppView.backgroundColor = [UIColor whiteColor];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 50)];
        lable.text = [NSString stringWithFormat:@"%@热门旅游目的地",_mytitle ];
        lable.font = [UIFont systemFontOfSize:20 weight:1];
        [suppView addSubview:lable];
        
        
        
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        //要返回尾视图
        suppView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footID" forIndexPath:indexPath ];
        
        suppView.backgroundColor = [UIColor whiteColor];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 50)];
        lable.text = @"其他旅游目的地";
        lable.font = [UIFont systemFontOfSize:20 weight:1];
        [suppView addSubview:lable];
        
    }
    
    return suppView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
