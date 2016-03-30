//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import <UIKit/UIKit.h>
#import "MoreSubject.h"

@interface MoreSubjectTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *topImageView;

- (void)configData:(SubjectData*)model;

@end
