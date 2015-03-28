//
//  Request.h
//  ADFHotpepperReader
//
//  HTTP通信処理を行う
//  APIについては下記URLを参照してください
//  http://webservice.recruit.co.jp/hotpepper/reference.html
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Request : NSObject

+ (void)getWithQuery:(NSString*)query completionHandler: (id)completionHandler;

@end
