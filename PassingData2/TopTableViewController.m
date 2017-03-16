//
//  TopTableViewController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "TopTableViewController.h"

@interface TopTableViewController ()

@property float sum;

- (void) showSumPrice:(Product *)item;

@end

@implementation TopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [[NSMutableArray alloc] init];
    self.sum = 0;
    
    NSArray<NSString *>
    *dataFoodLabel  = @[@"Food ID", @"Food name", @"Food Price", @"Food made in country", @"Food calorie", @"Food size", @"Food ingredients"],
    *dataFoodValue  = @[@"100", @"Chicken", @"8", @"Canada", @"350", @"4", @"chicken, oil, chees"],
    *dataDrinkLabel = @[@"Drink ID", @"Drink name", @"Drink Price", @"Drink made in country", @"is Drink diet?", @"Drink size"],
    *dataDrinkValue = @[@"412", @"Pepsi", @"2", @"USA", @"NO", @"150"],
    *dataClothLabel = @[@"Cloth ID", @"Cloth name", @"Cloth Price", @"Cloth made in country", @"Cloth Materials"],
    *dataClothValue = @[@"701", @"T-shirt", @"15", @"China", @"Cotton, Nylon"];
    
    self.key = @[@"category", @"label", @"default", @"image"];
    self.data = @[@{self.key[0]:@"Food",
                    self.key[1]:dataFoodLabel,
                    self.key[2]:dataFoodValue,
                    self.key[3]:@"icon_food.png"},
                  
                  @{self.key[0]:@"Drink",
                    self.key[1]:dataDrinkLabel,
                    self.key[2]:dataDrinkValue,
                    self.key[3]:@"icon_drink.png"},
                  
                  @{self.key[0]:@"Cloth",
                    self.key[1]:dataClothLabel,
                    self.key[2]:dataClothValue,
                    self.key[3]:@"icon_cloth.png"}];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        
        cell.textLabel.text = [@"$" stringByAppendingString:@(self.sum).stringValue];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Send data to InputViewController
    if ([segue.identifier isEqualToString:@"toInputTableViewID"]) {
        InputTableViewController *controller = [segue destinationViewController];
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        controller.selectedProduct = [self.data[indexPath.row] valueForKey:self.key[0]];
        controller.data = self.data;
        controller.key = self.key;
        controller.delegate = self;
        
    } else if ([segue.identifier isEqualToString:@"toItemListTableViewID"]) {
        ItemListTableViewController *controller = [segue destinationViewController];
        
        controller.items = self.items;
    }
}

- (void) item:(Product *)item {
    
    [self.items addObject:item];
    [self showSumPrice:item];
}

- (void) showSumPrice:(Product *)item {
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    self.sum += [item price];
    cell.textLabel.text = [@"Total $" stringByAppendingString:@(self.sum).stringValue];
}

@end
