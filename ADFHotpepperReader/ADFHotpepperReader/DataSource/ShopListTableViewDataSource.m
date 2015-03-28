//
//  ShopListTableViewDataSource.m
//  ADFHotpepperReader
//
//  Created by Kohei Hayakawa on 3/16/15.
//  Copyright (c) 2015 Application Developer Festival. All rights reserved.
//

#import "ShopListTableViewDataSource.h"

@implementation ShopListTableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shops.count;
}

// セルにお店の名前を表示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];

    Shop *shop = self.shops[indexPath.row];
    cell.textLabel.text = shop.name;
    
    return cell;
}

@end
