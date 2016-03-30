//
//  DetailViewController.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "DetailViewController.h"
#import "HttpEngine.h"
#import "Define.h"
#import "SModel.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "CityListCell.h"
#import "CityDetailViewController.h"
#import "LocationMapViewController.h"
#import "City_listViewController.h"

@interface DetailViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *dataSouce;
@property (nonatomic,strong)NSMutableArray  *hot_citySouce;
@property (nonatomic,strong)NSMutableArray *hot_mguideSouce;
@property (nonatomic,strong)NSMutableArray *n_discountSouce;
@property (nonatomic,strong)DataModel1 *model;
@property (nonatomic,strong)UIScrollView *boomScrollView;
@property (nonatomic,strong)UIScrollView *imageScrollView;
@property (nonatomic,strong)UIImageView *imageView1;
@property (nonatomic,strong)UIImageView *fountView;


@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonnull,strong)UITableView *tableView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.hidesBottomBarWhenPushed = YES;
    [self loadData];
    self.title = self.hotCityName;
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
}

- (void)loadData{
    _dataSouce       = [NSMutableArray array];
    _hot_citySouce   = [NSMutableArray array];
    _hot_mguideSouce = [NSMutableArray array];
    _n_discountSouce = [NSMutableArray array];
    
    HttpEngine *enger = [HttpEngine shareEngine];
    NSString *str = @"###";
    NSRange range = [DetailURL rangeOfString:str];
    
    NSString *tureUrl = [DetailURL stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%ld",self.channleID]];

    [enger GET:tureUrl parameters:nil success:^(id response) {
        NSError *error = nil;
         _model = [[DataModel1 alloc]initWithDictionary:response[@"data"] error:&error];
        _hot_citySouce = [Hot_CityModel1 arrayOfModelsFromDictionaries:response[@"data"][@"hot_city"] error:&error];
        
        _hot_mguideSouce = [Hot_MguideModel1 arrayOfModelsFromDictionaries:response[@"data"][@"hot_mguide"] error:&error];
        
        _n_discountSouce = [New_DiscountModel1 arrayOfModelsFromDictionaries:response[@"data"][@"new_discount"] error:&error];
        [self creatScrollView];
    } failed:^(NSError *error) {
        
        
    }];
}
#pragma  mark 创建ScrollView
- (void)creatScrollView {
    _boomScrollView = [[UIScrollView alloc]init];
    _boomScrollView.delegate = self;
    _boomScrollView.backgroundColor = [UIColor whiteColor];
    _boomScrollView.userInteractionEnabled = YES;
    [self.view addSubview:_boomScrollView];
    [_boomScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.height.mas_equalTo(self.view.frame.size.height);
    }];
    
    _boomScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 495+self.n_discountSouce.count*100);
    _boomScrollView.bounces = NO;
    _imageScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
    _imageScrollView.delegate = self;
    _imageScrollView.backgroundColor = [UIColor yellowColor];
    _imageScrollView.pagingEnabled = YES;
    _imageScrollView.bounces    = NO;
    _imageScrollView.contentSize = CGSizeMake(self.view.frame.size.width*self.model.photos.count, 220);
    
    [self.boomScrollView addSubview:_imageScrollView];

    
    [self creatImageView];
    [self creatCollectionView];
    [self creatTableView];
}
- (void)creatImageView {
    
    for (NSInteger i=0; i<self.model.photos.count; i++) {
        _imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i,  0, self.view.frame.size.width, 220)];
        [_imageView1 sd_setImageWithURL:[NSURL URLWithString:self.model.photos[i]]];
        [self.imageScrollView addSubview:_imageView1];
        
    }

    _fountView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
    _fountView.image = [UIImage imageNamed:@"GroupMember_Cell_Mask"];
    [self.boomScrollView addSubview:_fountView];
    
//    _fountView.userInteractionEnabled = YES;
    
    UILabel *titleCountry = [[UILabel alloc]init];
    [_fountView addSubview:titleCountry];
    titleCountry.text = [NSString stringWithFormat:@"%@  %@",self.hotCityName,self.model.enname] ;
    titleCountry.font = [UIFont systemFontOfSize:20 ];
    titleCountry.textColor = [UIColor whiteColor];
    [titleCountry mas_makeConstraints:^(MASConstraintMaker *make) {
        [titleCountry mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_fountView.mas_top).offset(120);
            make.leading.equalTo(_fountView.mas_leading).offset(20);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(350);
        }];

    }];

    UILabel *countryDetail = [[UILabel alloc]init];
    [_fountView addSubview:countryDetail];
    countryDetail.text = self.model.entryCont ;
    countryDetail.font = [UIFont systemFontOfSize:15 ];
    countryDetail.textColor = [UIColor whiteColor];
    countryDetail.numberOfLines = 0;

    [countryDetail mas_makeConstraints:^(MASConstraintMaker *make)  {
            make.top.equalTo(_fountView.mas_top).offset(155);
            make.leading.equalTo(_fountView.mas_leading).offset(20);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(self.view.frame.size.width-20);
        
    }];
    
    UILabel *countryDetail1 = [[UILabel alloc]init];
    [_boomScrollView addSubview:countryDetail1];
    countryDetail1.text = @"【国家详细信息】" ;
    countryDetail1.textAlignment = NSTextAlignmentRight;
    countryDetail1.font = [UIFont systemFontOfSize:15 ];
    countryDetail1.textColor = [UIColor whiteColor];
    countryDetail1.numberOfLines = 0;
    countryDetail1.userInteractionEnabled = YES;
    [countryDetail1 mas_makeConstraints:^(MASConstraintMaker *make)  {
        make.bottom.equalTo(_fountView.mas_bottom).offset(-4);
        make.trailing.equalTo(_fountView.mas_trailing).offset(5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(self.view.frame.size.width-20);
        
    }];
    
    //创建了一个点击的手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    //往lable上面添加一个手势
    [countryDetail1 addGestureRecognizer:tap];
    [self creatMapButn];
}
#pragma mark - 创建Map
- (void)creatMapButn {
    UIButton *butn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_boomScrollView addSubview:butn];
    [butn setBackgroundImage:[UIImage imageNamed:@"其他"] forState:UIControlStateNormal];
    [butn mas_makeConstraints:^(MASConstraintMaker *make)  {
        make.top.equalTo(self.view.mas_top).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(35);
        
    }];
    [self.boomScrollView bringSubviewToFront:butn];
    [butn addTarget:self action:@selector(locations) forControlEvents:UIControlEventTouchUpInside];
}
- (void)locations {
    LocationMapViewController *LMVC = [[LocationMapViewController alloc]init];
    LMVC.url = [NSString stringWithFormat:@"%ld",self.channleID];
    LMVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:LMVC animated:YES];
}

- (void)tapClick{
    CityDetailViewController *cityVc = [[CityDetailViewController alloc]init];
    cityVc.hidesBottomBarWhenPushed = YES;
    cityVc.url = self.model.overview_url;
    

    
    [self.navigationController pushViewController:cityVc animated:YES];
}

#pragma mark 创建热门城市
//创建热门城市
- (void)creatCollectionView {
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.itemSize = CGSizeMake(160, 90);
    flowLayOut.minimumLineSpacing = 20;
    //每行内部cell item的间距
    flowLayOut.minimumInteritemSpacing = 5;
    //内边距
    flowLayOut.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.footerReferenceSize = CGSizeMake(50, 50);
    
    
    //附加头视图 大小 水平滚动 宽度有效，高度无效
    flowLayOut.headerReferenceSize = CGSizeMake(20, 30);



    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 225, self.view.frame.size.width-40, 250) collectionViewLayout:flowLayOut];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID"];
    _collectionView.scrollEnabled = NO;
    _collectionView.delegate   = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.boomScrollView addSubview:_collectionView];
    

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    Hot_CityModel1 *model = self.hot_citySouce[indexPath.row];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.photo]];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.4;
    
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 20)];
    lable.center = cell.contentView.center;
    lable.text = model.cnname;
    lable.font = [UIFont systemFontOfSize:18 weight:0.8];
    lable.textColor = [UIColor whiteColor];
    lable.textAlignment = NSTextAlignmentCenter;
    
    [cell.contentView addSubview:imageView];
    [cell.contentView addSubview:view];
    [cell.contentView addSubview:lable];
    
    
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *suppView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //说明是要我们返回头视图
        suppView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID" forIndexPath:indexPath ];
        
        UILabel *lable = [[UILabel alloc]init];
        lable.text = [NSString stringWithFormat:@"%@城市",self.hotCityName];
        lable.font = [UIFont systemFontOfSize:18];
        [suppView addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(suppView.mas_top).offset(10);
            make.leading.equalTo(suppView.mas_leading).offset(20);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(150);
        }];

        
        UILabel *lable1 = [[UILabel alloc]init];
        [suppView addSubview:lable1];
        lable1.text = @"查看全部";
        lable1.font = [UIFont systemFontOfSize:18];
        
        [lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(suppView.mas_top).offset(10);
            make.trailing.equalTo(suppView.mas_trailing).offset(0);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(80);
        }];
        lable1.userInteractionEnabled = YES;
        //创建了一个点击的手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(morCityTap)];
        //往lable上面添加一个手势
        [lable1 addGestureRecognizer:tap];

        
    }
    return suppView;

}

- (void)morCityTap {
    City_listViewController *LVC = [[City_listViewController alloc]init];
    LVC.channlID = [NSString stringWithFormat:@"%ld",self.channleID ];
    [self.navigationController pushViewController:LVC animated:YES];
}

#pragma mark 创建普通城市列表
- (void)creatTableView{
    
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"超值自由行";
    lable.font = [UIFont systemFontOfSize:18];
    [self.boomScrollView addSubview:lable];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(15);
        make.leading.equalTo(self.collectionView.mas_leading).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(150);
    }];

    
    
    UILabel *lable1 = [[UILabel alloc]init];
    [self.boomScrollView addSubview:lable1];
    lable1.text = @"查看全部";
    lable1.font = [UIFont systemFontOfSize:18];
    
    [lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(15);
        make.trailing.equalTo(self.collectionView.mas_trailing).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(80);
    }];

    
    if (self.n_discountSouce.count == 0 ) {
        _tableView = nil;
        [lable removeFromSuperview];
        [lable1 removeFromSuperview];
        _boomScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    }else{
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 520, self.view.frame.size.width-40, 90*self.n_discountSouce.count)];
    }
    

    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled =NO;
    _tableView.backgroundColor = [UIColor grayColor];
    [_tableView registerNib:[UINib nibWithNibName:@"CityListCell" bundle:nil] forCellReuseIdentifier:@"cellID"];

    
    [self.boomScrollView addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.n_discountSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    New_DiscountModel1 *model = self.n_discountSouce[indexPath.row];
    [cell configerData:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
