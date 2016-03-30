//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "JinNangDetailViewController.h"
#import "TableHeaderView.h"
#import "JinNangDetailTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "RightCollectionView.h"

@interface JinNangDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UIButton *downLoadButon;

@property (nonatomic, strong)  UILabel *sizeLable;
@property (nonatomic, strong)  UILabel *updateTime;
@property (nonatomic, strong)  UILabel *downloadTimes;

@property (nonatomic, strong) UIView *tabHeaderView;

@end

@implementation JinNangDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view from its nib.
}

- (void)loadData {
    [self createUI];
    [self createContent];
    [self configTabView];


}
- (void)createUI {
    
    _tabHeaderView = [[UIView alloc] init];
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, 150)];
   
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:_url]];
    [self.tabHeaderView addSubview:_headerImageView];

    CGFloat Y = _headerImageView.frame.size.height;
    
    _sizeLable = [[UILabel alloc] initWithFrame:
                  CGRectMake(10, Y - 20, 80, 30)];

    _sizeLable.textColor = [UIColor whiteColor];
    _sizeLable.font = [UIFont systemFontOfSize:13];
    [_headerImageView addSubview:_sizeLable];
    
    
    _updateTime = [[UILabel alloc] initWithFrame:
                     CGRectMake(100, Y - 20, 90, 30)];
    _updateTime.textColor = [UIColor whiteColor];
    _updateTime.font = [UIFont systemFontOfSize:13];
    [_headerImageView addSubview:_updateTime];
    
    
    _downloadTimes = [[UILabel alloc] initWithFrame:
                      CGRectMake(200, Y - 20, 100, 30)];
    _downloadTimes.textColor = [UIColor whiteColor];
    _downloadTimes.font = [UIFont systemFontOfSize:13];

}


- (void)configData {
    
    CGFloat tmep = _model.mobile.size/1024/1024;
    
     _sizeLable.text = [NSString stringWithFormat:
                                      @"大小：%.2fM",tmep];
    
    NSString *updateTime = [CaculateDate caculateDataWithSecond:[_model.update_time integerValue]];
    _updateTime.text = [NSString stringWithFormat:@"更新:%@",updateTime];
    
    _downloadTimes.text = [NSString stringWithFormat:@"下载：%ld",_model.download];
 
}


- (void)createContent {
    
    CGFloat Y = CGRectGetMaxY(_headerImageView.frame);
    
    UILabel *title = [[UILabel alloc] initWithFrame:
                      CGRectMake(10, Y + 10, 100, 30)];
    title.text = @"简介";
    
    title.font = [UIFont systemFontOfSize:20];
    
    [self.tabHeaderView addSubview:title];
    
    CGSize size = [CaculateDate
                    caculateSizeWithString:_model.info];
    UILabel *content = [[UILabel alloc] initWithFrame:
                        CGRectMake(10, Y + 50, size.width, size.height)];
    
    content.numberOfLines = 0;
    content.text = _model.info;
    content.textColor = [UIColor grayColor];
    [content sizeToFit];
    [self.tabHeaderView addSubview:content];
    
    
    CGFloat contentY = CGRectGetMaxY(content.frame);
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, contentY + 10, self.view.frame.size.width, 1)];
    line.backgroundColor = [UIColor blackColor];
    line.alpha = 0.5;
    
    [self.tabHeaderView addSubview:line];
    
    
    UILabel *author = [[UILabel alloc] initWithFrame:CGRectMake(10, contentY + 11, 200, 30)];
    author.text = @"锦囊作者";
    
    [self.tabHeaderView addSubview:author];
    
    
    
    UIImageView *authorView = [[UIImageView alloc]
                               initWithFrame:CGRectMake(10, contentY + 51, 50, 50)];
    authorView.layer.masksToBounds = YES;
    authorView.layer.cornerRadius = 25;
    [authorView sd_setImageWithURL:[NSURL URLWithString:_model.authors[0].avatar]];
    
    [self.tabHeaderView addSubview:authorView];
    
    
    CGFloat authorViewX = CGRectGetMaxX(authorView.frame);
    
    UILabel *authorName = [[UILabel alloc] initWithFrame:CGRectMake(authorViewX + 20, contentY + 60, 100, 30)];
    authorName.textColor = [UIColor grayColor];
    authorName.text = _model.authors[0].username;
    [self.tabHeaderView addSubview:authorName];
    
    CGSize authorIntroduce = [CaculateDate caculateSizeWithString:_model.authors[0].intro];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, contentY + 111, authorIntroduce.width, authorIntroduce.height)];
    lable.numberOfLines = 0;
    lable.textColor = [UIColor grayColor];
    lable.text = _model.authors[0].intro;
    [lable sizeToFit];
    [self.tabHeaderView addSubview:lable];
    
    CGFloat lineY = CGRectGetMaxY(lable.frame);
    UIView *downLine = [[UIView alloc] initWithFrame:CGRectMake(0, lineY + 60, self.view.frame.size.width, 1)];
    downLine.backgroundColor = [UIColor blackColor];
    downLine.alpha = 0.5;
    
    [self.tabHeaderView addSubview:downLine];
    
    UILabel *lableJin = [[UILabel alloc] initWithFrame:CGRectMake(10, lineY + 21, 100, 30)];
    lableJin.text = @"相关锦囊";
    
    [self.tabHeaderView addSubview:lableJin];
    
    _tabHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, lableJin.frame.origin.y + 40);
    
    [self.view addSubview:_tabHeaderView];

}

- (void)configTabView {
    
    _tabView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tabView.tableHeaderView = _tabHeaderView;
    _tabView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tabView];
    
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerNib:
          [UINib nibWithNibName:@"JinNangDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
}

#pragma mark - 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.sourceArray.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JinNangDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    IdeaDetailRelated_Guides *guide = self.sourceArray[indexPath.row];
    cell.mobile = guide.mobile;
    [cell configData:guide];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 137;
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
