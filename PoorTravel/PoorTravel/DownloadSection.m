//
//  DownloadSection.m
//  PoorTravel
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#import "DownloadSection.h"
@interface DownloadSection ()<NSURLSessionDownloadDelegate>

@property (nonatomic, strong) NSURLSession *currentSession;

@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property (nonatomic, strong) NSData *resueData;

@property (nonatomic, strong) NSMutableData *resumeData;


@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic) NSNumber *value;

@end
@implementation DownloadSection

+ (instancetype)sharedDownloadSection {
    
    static DownloadSection *downloadTask = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloadTask = [[DownloadSection alloc] init];
    });
    
    return downloadTask;

}



- (void)downloadWithUrl:(NSString*)url {
    
    NSURL *urlDownload = [NSURL URLWithString:url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:urlDownload];
    
    NSURLSessionConfiguration *configtion = [NSURLSessionConfiguration defaultSessionConfiguration];
    _currentSession = [NSURLSession sessionWithConfiguration:configtion delegate:self delegateQueue:nil];
    _downloadTask = [_currentSession downloadTaskWithRequest:request];
    
    
}

- (void)startDownloadWithUrl:(NSString*)url {
    [self downloadWithUrl:url];
    _value = @0;
    if (self.resueData) {
        _downloadTask = [_currentSession
                         downloadTaskWithResumeData:_resueData];
        
        _resueData = nil;
        
    }
       [_downloadTask resume];
    
    
   
   _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(sendMessge) userInfo:nil repeats:YES];
   
}

- (void)sendMessge {
    
    NSDictionary *dic = @{@"values":_value};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"progresValue" object:self userInfo:dic];

}


- (void)cancleDownLoadWithUrl {
    
    
       [_downloadTask cancelByProducingResumeData:
               ^(NSData * _Nullable resumeData) {
            _resueData = resumeData;
        }];
}


- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {

}



- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    float value = totalBytesWritten*1.0/
                               totalBytesExpectedToWrite;
   
    _value = @(value);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
     [_timer invalidate];

}

@end
