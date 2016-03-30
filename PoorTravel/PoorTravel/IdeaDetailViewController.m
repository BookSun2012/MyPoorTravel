//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "IdeaDetailViewController.h"
#import "LoadNetData.h"
#import "Header.h"
#import "JinNangDetailViewController.h"
#import "IdeaDetailModel.h"
#import "TableHeaderView.h"
#import "JinNangDetailViewController.h"
#import "JinNangDetailTableViewCell.h"
#import "UMSocial.h"
@interface IdeaDetailViewController ()<UMSocialUIDelegate>
@property (nonatomic) NSInteger page;

@property (nonatomic, strong) UIView *progress;

@property (nonatomic, strong) JinNangDetailViewController *detailView;

@property (nonatomic, strong) UIButton *download;

@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation IdeaDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _page = 1;
   // _id = 37;
    [self createTabView];
    [self loadDataSource];
    [self createProgressView];
    [self createShareButton];
    self.edgesForExtendedLayout = NO;
    
    _progress = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 44)];
    _progress.backgroundColor = [UIColor redColor];
    
    _progress.alpha = 0.7;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveValues:) name:@"progresValue" object:nil];
    
    
    [_progress addSubview:self.download];
    [self.view addSubview:_progress];
    // Do any additional setup after loading the view.
}

- (void)createShareButton {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(btnPressed:)];
    

    self.navigationItem.rightBarButtonItem = item;

}

- (void)btnPressed:(UIBarButtonItem*)btn {

    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56e764f567e58e3a5c001dec"
                                      shareText:@"分享"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,UMShareToQzone,UMShareToSms,nil]
                                       delegate:self];

}

- (void)receiveValues:(NSNotification*)notify {

    NSDictionary *dic = notify.userInfo;
    float value = [dic[@"values"] floatValue];
    
    
    [self changeValueWith:value];
    
}

- (void)changeValueWith:(float)value {
    [_download removeFromSuperview];
    [_progress addSubview:_progressView];
    
    
    
    if (_progressView.progress >= 0.98) {
        
        [_progressView removeFromSuperview];
        
        [_progress addSubview:self.download];
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self ceateAletView];
        });
        
        
        
    }else {
        [_progressView setProgress:value animated:YES];
    }

}
- (UIProgressView*)createProgressView {
   
        _progressView = [[UIProgressView alloc]
                         init];
        _progressView.trackTintColor = [UIColor grayColor];
        [_progressView setProgress:0];
      _progressView.frame = CGRectMake(0,0, self.view.frame.size.width, 44);
      _progressView.backgroundColor = [UIColor redColor];
      _progressView.progressTintColor = [UIColor greenColor];
         return _progressView;
}

- (UIAlertController*)ceateAletView {
  
       UIAlertController *aletView = [UIAlertController alertControllerWithTitle:@"下载完成" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
         
        }];
        
        [aletView addAction:action];
   
   [self presentViewController:aletView animated:YES completion:nil];
    return aletView;
}


- (UIButton*)download {
    if (!_download) {
        _download = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        [_download setTitle:@"立即下载" forState:UIControlStateNormal];
        [_download addTarget:self action:@selector(downloadBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [_download setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    return _download;
}

- (void)downloadBtnPress:(UIButton*)btn {

    [_download removeFromSuperview];
 

}


- (void)loadDataSource {

    NSDictionary *dic =  @{@"client_id":@"qyer_ios",@"client_secret":@"cd254439208ab658ddf9",@"count":@20,@"id":@(_id),@"lat":@34.77416518102751,@"lon":@113.6696762321501,@"page":@(_page),@"track_app_channel":@"App%20Store",@"track_app_version":@"6.8.5",@"track_device_info":@"iPhone%204S",@"track_device":@"0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180",@"track_os":@"ios%208.0.2",@"v":@1};
    
    [[LoadNetData sharedLoadNetData] laodNetDataByPostUrl:@"http://open.qyer.com/qyer/guide/detail" para:dic success:^(id response) {
        
        IdeaDetailModel *ideaMoel = [[IdeaDetailModel alloc] initWithDictionary:response error:nil];
        ideaMoel.data = [[IdeaDeatilData alloc] initWithDictionary:response[@"data"] error:nil];
        ideaMoel.data.authors = [IdeaDetailAuthors arrayOfModelsFromDictionaries:response[@"data"][@"authors"] error:nil];
        
        _detailView.model = ideaMoel.data;
        
        
        ideaMoel.data.related_guides = [IdeaDetailRelated_Guides arrayOfModelsFromDictionaries:response[@"data"][@"related_guides"] error:nil];
        
        ideaMoel.data.mobile = [[IdeaDetailMobile alloc] initWithDictionary:response[@"data"][@"mobile"] error:nil];
        
        _detailView.sourceArray = [ideaMoel.data.related_guides copy];
        [_detailView loadData];
        [_detailView.tabView reloadData];
        
    } filed:^(id error) {
        
    }];

}

- (void)createTabView {
    _detailView = [[JinNangDetailViewController alloc] init];
    _detailView.url = _url;
    _detailView.view.frame = self.view.frame;
    
    [self addChildViewController:_detailView];
    [self.view addSubview:_detailView.view];
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
