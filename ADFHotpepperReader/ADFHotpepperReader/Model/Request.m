//
//  Request.m
//  ADFHotpepperReader
//
//  HTTP通信処理を行う
//  APIについては下記URLを参照してください
//  http://webservice.recruit.co.jp/hotpepper/reference.html
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import "Request.h"

@implementation Request

NSString* const kServerDomain = @"http://webservice.recruit.co.jp/hotpepper/gourmet/v1";
NSString* const kAPIKey = @"150d3d7de833b99b";
NSString* const kAPIResponseFormat = @"json";

// URLを生成してリクエストを投げる
+ (void)getWithQuery:(NSString *)query completionHandler:(id)completionHandler {
    NSString *urlStr = [NSString stringWithFormat:@"%@/?key=%@&format=%@&%@", kServerDomain, kAPIKey, kAPIResponseFormat, query];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler: completionHandler];
}

@end