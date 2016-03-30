//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "DiscountViewController.h"
#import "DiscountCollectionView.h"
#import "WebViewController.h"
#import "LoadNetData.h"
#import "Header.h"
#import "DiscountModel.h"
#import "CategoryModel.h"
#import "SegumentTabView.h"
@interface DiscountViewController ()<sendeEventDelegate>

@property (nonatomic, strong) DiscountCollectionView *collectionView;;

@property (nonatomic, strong) SegumentTabView *segueTabView;

@property (nonatomic) NSInteger page;



@property (nonatomic, strong) CategoryModel *model;
@end

@implementation DiscountViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTabView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = NO;
    _page = 1;
    [self createDiscountTabView];
    [self createButton];
   
    [self loadDataSource];

    
    // Do any additional setup after loading the view.
}



- (void)createButton {
//list_tab_left_selected
    
    NSArray *arr = @[@"折扣类型",@"出发地",@"目的地",@"旅行时间"];
    
    CGFloat X = 0;
    
    for (int i = 0; i < 4; i ++) {
        UIButton *selectRegion = [UIButton buttonWithType:
                                           UIButtonTypeSystem];
        selectRegion.frame = CGRectMake(X, 0, self.view.frame.size.width/4, 44);
        UILabel *la = [[UILabel alloc] initWithFrame:
                       selectRegion.frame];
        NSLog(@"%@",NSStringFromCGRect(la.frame));
        la.text = arr[i];
        la.backgroundColor = [UIColor clearColor];
        la.font = [UIFont systemFontOfSize:12];
        la.textColor = [UIColor grayColor];
        
        la.center = selectRegion.center;
        la.textAlignment = NSTextAlignmentCenter;

        [selectRegion setBackgroundImage:
                 [[UIImage imageNamed:@"list_tab_left_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                       forState:UIControlStateSelected];
       
        [selectRegion setImage:
                [[UIImage imageNamed:@"list_tab_left_selected"] imageWithRenderingMode:
                            UIImageRenderingModeAlwaysOriginal] forState:
                                        UIControlStateNormal];
        X = CGRectGetMaxX(selectRegion.frame);
        selectRegion.tag = 100 + i;
        [selectRegion addTarget:self action:
                              @selector(btnPress:) forControlEvents:
                                         UIControlEventTouchUpInside];
        [self.view addSubview:selectRegion];
         [self.view addSubview:la];
    }
}

- (void)btnPress:(UIButton*)btn {
    
      [self createTabView];
    
    SegumentTabView  *view = nil;
    
    if (btn.tag == 102) {
      view = [[SegumentTabView alloc] initWithFrame:
                                CGRectMake(200, 0, self.view.frame.size.width/2, 300) style:UITableViewStylePlain];
        view.showsVerticalScrollIndicator = NO;
        [_segueTabView addSubview:view];
    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cell" object:self userInfo:@{@"tag":@(btn.tag)}];
    
    CGSize size = CGSizeMake(self.view.frame.size.width, 300);

    [UIView animateWithDuration:0.5 animations:^{
        _segueTabView.frame = CGRectMake(0, 0, size.width, size.height);
        
    }];
    
    __block DiscountViewController *weakSelf = self;
    
    [_segueTabView setBlock:^(NSMutableArray *arr, UITableView *tabView) {
        
        CGRect frame = CGRectMake(0, 0, 0, 0);
        
        if (btn.tag != 102 || (btn.tag == 102 && tabView == view)) {
            
            
            [UIView animateWithDuration:0.5 animations:^{
                
                weakSelf.segueTabView.frame = frame;
            
            } completion:^(BOOL finished) {
               
                weakSelf.page = 10;
                [weakSelf loadDataSource];
                [weakSelf.segueTabView removeFromSuperview];
                
            }];
        }
        view.sourceArray = arr;
        [view reloadData];
        
    }];
    
    [view setBlock:^(NSMutableArray *arr, UITableView *tabView) {
        CGRect frame = CGRectMake(0, 0, 0, 0);
        
        if (btn.tag != 102 || (btn.tag == 102 && tabView == view)) {
            
            
            [UIView animateWithDuration:0.5 animations:^{
                
                weakSelf.segueTabView.frame = frame;
                
            } completion:^(BOOL finished) {
                
                
                weakSelf.page = 10;
                [weakSelf loadDataSource];
                [weakSelf.segueTabView removeFromSuperview];
                
            }];
        }
    }];
    
    [self loadCategorydataSource];
}

- (void)loadDataSource {
//DiscountHome
    
    NSString *page = [NSString stringWithFormat:@"page=%ld",_page];
    
    NSString *url = [DiscountHome stringByReplacingOccurrencesOfString:@"page=^^" withString:page];
    
    [[LoadNetData sharedLoadNetData] loadNetDataWithUrl:url success:^(id response) {
        
        DiscountModel *model = [[DiscountModel alloc] initWithDictionary:response error:nil];
        
        
        model.data = [[DiscountData alloc] initWithDictionary:response[@"data"] error:nil];
        
        model.data.lastminutes = [DiscountLastminutes arrayOfModelsFromDictionaries:response[@"data"][@"lastminutes"] error:nil];
        
        [_collectionView.sourceArray addObjectsFromArray:model.data.lastminutes];
        
        [_collectionView reloadData];
    } filed:^(id error) {
        
    
    }];
}

- (void)loadCategorydataSource {

    [[LoadNetData sharedLoadNetData] loadNetDataWithUrl:CategoryDiscount success:^(id response) {
        
        _model = [[CategoryModel alloc] initWithDictionary:response error:nil];
        
        _model.data = [[CategoryData alloc] initWithDictionary:response[@"data"] error:nil];
        _model.data.departure = [CategoryDeparture arrayOfModelsFromDictionaries:response[@"data"][@"departure"] error:nil];
        [_segueTabView.startRegion addObjectsFromArray:_model.data.departure];
        _model.data.filter_tags = [CategoryFilter_Tags arrayOfModelsFromDictionaries:response[@"data"][@"filter_tags"] error:nil];
        _model.data.poi = [CategoryPoi arrayOfModelsFromDictionaries:response[@"data"][@"poi"] error:nil];
        [_segueTabView.stopRegion addObjectsFromArray:_model.data.poi];
        int i = 0;
        for (CategoryPoi *country  in _model.data.poi) {
            country.country = [CategoryCountry arrayOfModelsFromDictionaries:response[@"data"][@"poi"][i][@"country"] error:nil];
            i++;
        }
        _model.data.type = [CategoryType arrayOfModelsFromDictionaries:response[@"data"][@"type"] error:nil];
        [_segueTabView.ticket addObjectsFromArray:_model.data.type];
        _model.data.times_drange =[CategoryTimes_Drange arrayOfModelsFromDictionaries:response[@"data"][@"times_drange"] error:nil];
        [_segueTabView.time addObjectsFromArray:_model.data.times_drange];
        [_segueTabView reloadData];
    } filed:^(id error) {
        
    }];



}



- (void)createDiscountTabView {
    UICollectionViewFlowLayout *fly = [[UICollectionViewFlowLayout alloc] init];
    fly.itemSize = CGSizeMake(186, 258);
    fly.minimumLineSpacing = 10;

    
    _collectionView = [[DiscountCollectionView alloc] initWithFrame:
                                              CGRectMake(10, 44, self.view.frame.size.width - 20, self.view.frame.size.height - 44) collectionViewLayout:fly];
    _collectionView.discountDelegate = self;

    __weak  DiscountViewController *weckSelf = self;
    [_collectionView setBlock:^(NSInteger page) {
        _page = page;
        
        [weckSelf loadDataSource];
    }];
    [self.view addSubview:_collectionView];
    
}

- (void)sendEventWithUrl:(NSURL *)url {

   WebViewController *web = [[WebViewController alloc] init];
    web.url = url;
    [self.navigationController pushViewController:web animated:YES];
}


/**
 *  创建分栏
 */

- (void)createTabView {

    _segueTabView = [[SegumentTabView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];

    [self.view addSubview:_segueTabView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
