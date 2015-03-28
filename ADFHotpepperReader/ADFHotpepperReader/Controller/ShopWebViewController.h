//
//  ShopWebViewController.h
//  ADFHotpepperReader
//
//  お店のURLからWebViewで表示
//  リンクをシェアすることもできる
//  TODO: ブラウザの戻る/進むボタンの設置
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

@interface ShopWebViewController : UIViewController<UIWebViewDelegate>

- (id)initWithShop:(Shop *)shop;

@end
