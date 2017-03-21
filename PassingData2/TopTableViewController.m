//
//  TopTableViewController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "TopTableViewController.h"
#import "NavigationController.h"

@interface TopTableViewController ()

@property float totalPrice;

@end

@implementation TopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = ((NavigationController*)(self.navigationController)).data;
    self.key  = ((NavigationController*)(self.navigationController)).key;
    self.totalPrice = 0;
}

-(void)viewWillAppear:(BOOL)animated {
    self.items = ((NavigationController*)(self.navigationController)).items;
    
    if (self.items.count != 0) {
        [self setTotalPrice];
        [self setBadge];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.data.count;
        
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopTableViewCellID" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:[self.data[indexPath.row] valueForKey:self.key[3]]];
        cell.textLabel.text = [self.data[indexPath.row] valueForKey:self.key[0]];
        return cell;
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopTableViewPriceCellID" forIndexPath:indexPath];
        cell.textLabel.text = [@"Total $" stringByAppendingString:@(self.totalPrice).stringValue];
        return cell;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Send data to InputViewController
    if ([segue.identifier isEqualToString:@"toInputTableViewID"]) {
        InputTableViewController *controller = [segue destinationViewController];
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        controller.productType = indexPath.row;
    }
}

- (void) setTotalPrice {
    
    // Get the tableView's section for Total Price
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    // Caliculate
    self.totalPrice = 0;
    for (Product *item in self.items) {
        self.totalPrice += [item price];
    }
    // Set text
    cell.textLabel.text = [NSString stringWithFormat:@"Total $%.2f", self.totalPrice];
}

- (void) setBadge { // Add badge on TabBarButton
    UITabBarItem *itemListTabBarItem = (UITabBarItem *)[self.tabBarController.tabBar.items objectAtIndex:1];
    itemListTabBarItem.badgeValue = [NSString stringWithFormat:@"%lu", (unsigned long)self.items.count];
}

@end

