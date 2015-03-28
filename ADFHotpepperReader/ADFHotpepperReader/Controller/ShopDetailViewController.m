//
//  ShopDetailViewController.m
//  ADFHotpepperReader
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "ShopWebViewController.h"

@interface ShopDetailViewController () <ShopDetailViewDelegate>

@property (strong, nonatomic) Shop *shop;
@property (strong, nonatomic) ShopDetailView *shopDetailView;

@end

@implementation ShopDetailViewController

- (id)initWithShopModel:(Shop *)shop {
    self = [super init];
    if (self) {
        self.shop = shop;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"お店詳細";
    
    self.shopDetailView = [[ShopDetailView alloc] initWithFrame:self.view.frame];
    self.shopDetailView.delegate = self;

    self.shopDetailView.shop = self.shop;
    
    [self.view addSubview:self.shopDetailView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ShopDetailViewDelegate

- (void)shopDetailView:(ShopDetailView *)view tappedShopLinkButton:(UIButton *)button {
    ShopWebViewController *shopWebViewController = [[ShopWebViewController alloc] initWithShop:self.shop];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:shopWebViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

@end
