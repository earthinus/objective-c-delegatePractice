//
//  ItemListTableViewController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ItemListTableViewController.h"

@interface ItemListTableViewController ()

@property (strong, nonatomic) NSMutableArray<Food *> *foodItems;
@property (strong, nonatomic) NSMutableArray<Drink *> *drinkItems;
@property (strong, nonatomic) NSMutableArray<Cloth *> *clothItems;

@end

@implementation ItemListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    _foodItems = [[NSMutableArray<Food *> alloc] init];
    _drinkItems = [[NSMutableArray<Drink *> alloc] init];
    _clothItems = [[NSMutableArray<Cloth *> alloc] init];
    
    for (int i = 0; i < _items.count; i++) {
        
        if ([_items[i] isMemberOfClass:[Food class]]) {
            [_foodItems addObject:(Food *)_items[i]];
            
        } else if ([_items[i] isMemberOfClass:[Drink class]]) {
            [_drinkItems addObject:(Drink *)_items[i]];
            
        } else {
            [_clothItems addObject:(Cloth *)_items[i]];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 43;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return _foodItems.count;
        
    } else if (section == 1) {
        return _drinkItems.count;
        
    } else {
        return _clothItems.count;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *cellIdentifier = @"ItemHeaderTableViewCellID";
    ItemHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    }
    if (section == 0) {
        cell.headerLabel.text = @"Food";
    } else if (section == 1) {
        cell.headerLabel.text = @"Drink";
    } else {
        cell.headerLabel.text = @"Cloth";
    }
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifer;
    
    if (indexPath.section == 0) {
        cellIdentifer = @"FoodItemTableViewCellID";
        FoodItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (!cell) {
            cell = [[FoodItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.foodImageView.image = [UIImage imageNamed:@"icon_food.png"];
        cell.foodNameLabel.text = _foodItems[indexPath.row].productName;
        cell.foodSumPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _foodItems[indexPath.row].price];
        cell.foodPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _foodItems[indexPath.row].productPrice];
        cell.foodSizeLabel.text = [NSString stringWithFormat:@"size: %ld", _foodItems[indexPath.row].foodSize];
        return cell;
        
    } else if (indexPath.section == 1) {
        
        cellIdentifer = @"DrinkItemTableViewCellID";
        DrinkItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (!cell) {
            cell = [[DrinkItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.drinkImageView.image = [UIImage imageNamed:@"icon_drink.png"];
        cell.drinkNameLabel.text = _drinkItems[indexPath.row].productName;
        cell.drinkPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _drinkItems[indexPath.row].productPrice];
        cell.drinkSizeLabel.text = [NSString stringWithFormat:@"size: %ld", _drinkItems[indexPath.row].drinkSize];
        return cell;
        
    } else {
        
        cellIdentifer = @"ClothItemTableViewCellID";
        ClothItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (!cell) {
            cell = [[ClothItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.clothImageView.image = [UIImage imageNamed:@"icon_cloth.png"];
        cell.clothNameLabel.text = _clothItems[indexPath.row].productName;
        cell.clothPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _clothItems[indexPath.row].productPrice];
        return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
