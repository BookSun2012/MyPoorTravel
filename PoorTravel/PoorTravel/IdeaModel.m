//
//  LoadNetData.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/10.
//  Copyright © 2016年 周书阳. All rights reserved.

#import "IdeaModel.h"

@implementation IdeaModel : CommonModel







+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [IdeaData class]};
}
@end





@implementation IdeaData

+ (NSDictionary *)objectClassInArray{
    return @{@"guides" : [IdeaGuides class]};
}

@end


@implementation IdeaGuides

@end


