//
//  Shop.m
//  ADFHotpepperReader
//
//  お店に関するModel
//  APIについては下記URLを参照してください
//  http://webservice.recruit.co.jp/hotpepper/reference.html
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import "Shop.h"
#import "Request.h"
#import "ADFNotifications.h"

@implementation Shop

- (id) initWithShopDictionary: (NSDictionary*)shopDictionary {
    self = [super init];
    if (self) {
        self.name = [shopDictionary objectForKey:@"name"];
        self.url = [[shopDictionary objectForKey:@"urls"] objectForKey:@"pc"];
    }
    return self;
}

/* 大エリアコードで店のリストを取得
 */
+ (void)getShopListWithLargeAreaCode:(NSString*)largeAreaCode {

    id completionHandler = ^(NSURLResponse *response, NSData *jsonData, NSError *error) {
        
        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:NSJSONReadingAllowFragments
                                                                  error:&error];
        NSDictionary *results = [jsonObj objectForKey:@"results"];
        NSArray *shopArray = [results objectForKey:@"shop"];
        NSMutableArray *shopList = [[NSMutableArray alloc] init];
        
        for (id shopDictionary in shopArray) {
            Shop *shop = [[Shop alloc] initWithShopDictionary:shopDictionary];
            [shopList addObject:shop];
        }
        
        NSDictionary *userInfo = @{@"shops" : shopList};
        [[NSNotificationCenter defaultCenter] postNotificationName:ADFSuccessGetShopList
                                                            object:self
                                                          userInfo:userInfo];
    };
    
    NSString *query = [NSString stringWithFormat:@"large_area=%@", largeAreaCode];
    [Request getWithQuery:query completionHandler:completionHandler];
}

@end

