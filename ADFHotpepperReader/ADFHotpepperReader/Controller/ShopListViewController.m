
#import "ShopListViewController.h"
#import "ShopDetailViewController.h"
#import "ShopListTableViewDataSource.h"
#import "ADFNotifications.h"
#import "Shop.h"

@interface ShopListViewController ()

@property (strong, nonatomic) NSString *largeAreaCode;
@property (strong, nonatomic) ShopListTableViewDataSource *dataSource;

@end


@implementation ShopListViewController

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //通信が完了した時のnotification登録
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onSuccessGetShopList:) name:ADFSuccessGetShopList object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onFailureGetShopList:) name:ADFSuccessGetShopList object:nil];
    
    self.title = @"お店一覧";
    self.largeAreaCode = @"Z011"; // 今回は大エリアコードを東京(Z011)に固定する
    
    // ShopListTableViewを初期化
    self.dataSource = [[ShopListTableViewDataSource alloc] init];
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self.dataSource;
    
    // pull to refresh のイベントを追加
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(onRefresh:)
             forControlEvents:UIControlEventValueChanged];
    
    [self setRefreshControl:refreshControl];
    [self refreshShopList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
// pull to refreshで呼ばれる
- (void)onRefresh:(id)sender {
    [self refreshShopList];
}

// 新しい情報でテーブルビューをリフレッシュ
- (void)refreshShopList {
    [self.refreshControl beginRefreshing];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    // 大エリアコードを指定してのお店を取得
    [Shop getShopListWithLargeAreaCode:self.largeAreaCode];
}

- (void)onSuccessGetShopList:(NSNotification *)notificationCenter {
    NSArray *shops = [[notificationCenter userInfo] objectForKey:@"shops"];
    self.dataSource.shops = shops;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)onFailureGetShopList:(NSNotification *)notificationCenter {
    [[self refreshControl] endRefreshing];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - TableViewDelegate

// お店詳細画面に移動
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Shop *shop = self.dataSource.shops[indexPath.row];
    ShopDetailViewController *shopDetailViewController = [[ShopDetailViewController alloc] initWithShopModel:shop];
    [self.navigationController pushViewController:shopDetailViewController animated:YES];
}

@end
