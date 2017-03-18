//
//  ItemListTableViewController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItemTableViewCell.h"
#import "DrinkItemTableViewCell.h"
#import "ClothItemTableViewCell.h"
#import "ItemHeaderTableViewCell.h"
#import "Food.h"
#import "Drink.h"
#import "Cloth.h"
#import "TabBarController.h"

@interface ItemListTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *itemListTableView;
@property (strong, nonatomic) IBOutlet NSMutableArray<Product *> *items;
@property (strong, nonatomic) NSArray<NSArray *> *data;
@property (strong, nonatomic) NSArray<NSString *> *key;

@end
