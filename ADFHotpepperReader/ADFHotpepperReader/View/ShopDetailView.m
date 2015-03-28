//
//  ShopDetailView.m
//  ADFHotpepperReader
//
//  お店の詳細情報を表示する
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import "ShopDetailView.h"
#import "Shop.h"

@interface ShopDetailView ()

@property (strong, nonatomic) UILabel *shopNameLabel;   // お店の名前用のラベル
@property (strong, nonatomic) UIButton *shopLinkButton; // お店のWebページへ移動するボタン

@end

@implementation ShopDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        // setup
        self.shopNameLabel = [UILabel new];
        self.shopNameLabel.frame = CGRectMake(0, 100, frame.size.width, 40);
        self.shopNameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: self.shopNameLabel];

        self.shopLinkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.shopLinkButton.frame = CGRectMake(0, 150, frame.size.width, 40);
        self.shopLinkButton.titleLabel.text = @"お店のページを見る";
        [self.shopLinkButton addTarget:self
                                action:@selector(tappedShopLinkButton:)
                      forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: self.shopLinkButton];
    }
    return self;
}

- (void)setShop:(Shop *)shop {
    self.shopNameLabel.text = shop.name;
}

- (void)tappedShopLinkButton:(UIButton *)button {
    [self.delegate shopDetailView:self tappedShopLinkButton:button];
}

@end
