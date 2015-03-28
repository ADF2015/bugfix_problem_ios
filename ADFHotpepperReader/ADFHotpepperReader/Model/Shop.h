//
//  Shop.h
//  ADFHotpepperReader
//
//  お店に関するModel
//  APIについては下記URLを参照してください
//  http://webservice.recruit.co.jp/hotpepper/reference.html
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Shop : NSObject

// 他にもいろいろレスポンスフィールドはあるけど今回は名前とURLだけを使う
@property (strong, nonatomic) NSString *name; // 店の名前
@property (strong, nonatomic) NSString *url;  // 店のURL(モバイル用URL)

+ (void)getShopListWithLargeAreaCode:(NSString*)largeAreaCode;

@end
