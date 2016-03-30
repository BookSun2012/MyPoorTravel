//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "SegumentTabView.h"

@interface SegumentTabView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) NSInteger tagValue;

@end

@implementation SegumentTabView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {

        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"cell" object:nil];
        _time = [NSMutableArray array];
        _startRegion = [NSMutableArray array];
        _stopRegion = [NSMutableArray array];
        _ticket = [NSMutableArray array];
    }
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    return self;
}

- (void)receiveMessage:(NSNotification*)notify {
    NSDictionary *dic = notify.userInfo;
    _tagValue = [dic[@"tag"] intValue];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (_tagValue) {
        case 100:{
           
            return _ticket.count;
        }
            
            break;
        case 101:{
           
            return _startRegion.count;
        }
            
            break;
        case 102:{
           
            if (self.sourceArray == nil) {
                 return _stopRegion.count;
            }
           
           
            
            return _sourceArray.count;
         

           
                  }
            
            break;
        case 103:{
            return _time.count;
        }
            break;
        default:{
         
          
        }
            break;
    }

    
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.textColor = [UIColor grayColor];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    switch (_tagValue) {
        case 100:{
            CategoryType *model = self.ticket[indexPath.row];
            cell.textLabel.text = model.catename;
        }
            
            break;
        case 101:{
            CategoryDeparture *model = self.startRegion[indexPath.row];
            cell.textLabel.text = model.city_des;
        }
            
            break;
        case 102:{
            
            if (self.sourceArray == nil) {
                CategoryPoi *model = self.stopRegion[indexPath.row];
                cell.textLabel.text = model.continent_name;
            }else {
            
         
            
                CategoryCountry *country = self.sourceArray[indexPath.row];
                cell.textLabel.text = country.country_name;
      
            }
          
        }
            
            break;
        case 103:{
            CategoryTimes_Drange *model = self.time[indexPath.row];
            cell.textLabel.text = model.description;
        }
            break;
        default:{
//            CategoryTimes_Drange *model = self.time[indexPath.row];
//            cell.textLabel.text = model.times;
            
        }
            break;
    }
    
      return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (_tagValue == 102) {
        if (self.subviews.count == 4) {
            _sourceArray = [[self.stopRegion[indexPath.row] country] copy];
        }
}
    if (self.block) {
        self.block(_sourceArray,tableView);
    }

}

- (void)dealloc {



}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
