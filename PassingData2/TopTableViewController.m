//
//  TopTableViewController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "TopTableViewController.h"
#import "TabBarController.h"

@interface TopTableViewController ()

@property float sum;

- (void) showSumPrice:(Product *)item;

@end

@implementation TopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = ((TabBarController*)(self.tabBarController)).data;
    self.key = ((TabBarController*)(self.tabBarController)).key;
    self.sum = 0;
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
        
        cell.textLabel.text = [@"Total $" stringByAppendingString:@(self.sum).stringValue];
        return cell;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 100;
        
    } else {
        return 100;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Send data to InputViewController
    if ([segue.identifier isEqualToString:@"toInputTableViewID"]) {
        InputTableViewController *controller = [segue destinationViewController];
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        controller.delegate = self;
        controller.data = self.data;
        controller.key = self.key;
        controller.selectedProduct = [self.data[indexPath.row] valueForKey:self.key[0]];
    }
}

- (void) showSumPrice:(Product *)item {
    
    // Update items in TabBarController
    [((TabBarController*)(self.tabBarController)).items addObject:item];
    
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    self.sum += [item price];
    cell.textLabel.text = [@"Total $" stringByAppendingString:@(self.sum).stringValue];
}

@end

