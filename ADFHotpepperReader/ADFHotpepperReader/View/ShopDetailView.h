//
//  ShopDetailView.h
//  ADFHotpepperReader
//
//  お店の詳細情報を表示する
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopDetailView;
@class Shop;

@protocol ShopDetailViewDelegate <NSObject>

- (void)shopDetailView:(ShopDetailView *)view tappedShopLinkButton:(UIButton *)button;

@end

@interface ShopDetailView : UIView

@property (nonatomic, strong) id<ShopDetailViewDelegate> delegate;

- (void)setShop:(Shop *)shop;

@end


