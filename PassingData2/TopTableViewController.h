//
//  TopTableViewController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputTableViewController.h"
#import "Product.h"

@interface TopTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *TopTableView;
@property (strong, nonatomic) NSArray<NSString *> *productName;
@property (strong, nonatomic) NSMutableArray<Product *> *items;
@property (strong, nonatomic) NSArray<NSArray *> *data;
@property (strong, nonatomic) NSArray<NSString *> *key;

- (void) setTotalPrice;
- (void) setBadge;

@end
