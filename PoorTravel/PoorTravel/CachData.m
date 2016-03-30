//
//  CachData.m
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "CachData.h"
@interface CachData ()

@property (nonatomic, strong) FMDatabase *dataBase;

@end
@implementation CachData

+ (instancetype)sharedCachData {
    static CachData *data = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[CachData alloc] init];
    });
    return data;
}

- (void)createSqliteData {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask,YES) lastObject];

    NSString *lib = [path stringByAppendingPathComponent:@"date.sqlite"];
    
    _dataBase = [FMDatabase databaseWithPath:lib];
    
    NSString *sqlite = @"CREATE TABLE IF NOT EXITS T_cach(s_name   TEXT PARIMY KEY NOT NULL ,s_data BLOB)";
    
   BOOL r = [_dataBase executeUpdate:sqlite];
    
    if (r) {
        
    }else {
    
    
    }
    
}

- (void)increaeData {
   NSString *insert = @"INSERT INTO T_cach(s_name,s_data) VALUES (?,?)";
    [_dataBase executeUpdate:insert,@""];
    
}

- (void)findData {
      NSString *sqlite = @"SELECT * FROME T_cach LIMIT";

    [_dataBase executeUpdate:sqlite];
}

- (void)updataData {
     NSString *sqlite = @"UPDATE T_cach SET s_name =  WHERE s_name";
    [_dataBase executeUpdate:sqlite];
}

- (void)deleateData {
      NSString *sqlite = @"DELEATE FRAME T_cach WHERE s_namee=";
    [_dataBase executeUpdate:sqlite];

}

@end
