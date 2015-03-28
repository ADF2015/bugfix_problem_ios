//
//  ShopDetailViewController.h
//  ADFHotpepperReader
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopDetailView.h"
#import "Shop.h"

@interface ShopDetailViewController : UIViewController

- (id)initWithShopModel:(Shop *)shop;

@end

