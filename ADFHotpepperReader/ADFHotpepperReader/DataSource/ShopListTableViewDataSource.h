//
//  ShopListTableViewDataSource.h
//  ADFHotpepperReader
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

@interface ShopListTableViewDataSource : NSObject<UITableViewDataSource>

@property (strong, nonatomic) NSArray *shops;

@end
