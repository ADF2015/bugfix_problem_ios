//
//  ShopWebViewController.m
//  ADFHotpepperReader
//
//  お店のURLからWebViewで表示
//  リンクをシェアすることもできる
//  TODO: ブラウザの戻る/進むボタンの設置
//  戻る/進むボタンは未実装とします。（バグとは見なしません）
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import "ShopWebViewController.h"

@interface ShopWebViewController ()

@property (strong, nonatomic) Shop *shop;

@end

@implementation ShopWebViewController

- (id)initWithShop:(Shop *)shop {
    self = [super init];
    if (self) {
        self.shop = shop;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.shop.name;
    
    // X(閉じる)ボタンをnavbarの左に設置
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                                                   target:self
                                                                                   action:@selector(didPressedCloseBarButton:)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    // シェアボタンをnavbarの右に設置
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                    target:self
                                                                                    action:@selector(didPressedShareBarButton:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    // webviewをsetup
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:self.shop.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// シェアボタンが押された時にActivityViewを出す
- (void)didPressedShareBarButton:(UIBarButtonItem*)sender {
    // 本文とURLを生成
    NSString *title = [NSString stringWithFormat:@"ホットペッパーリーダーで「%@」をシェアしました！", self.shop.name];
    NSURL *url = [NSURL URLWithString:self.shop.url];
    
    NSArray *activityItems = @[title, url];
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityView animated:YES completion:nil];
}

// ページ読込開始時にインジケータを回す
- (void)webViewDidStartLoad:(UIWebView*)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

@end
