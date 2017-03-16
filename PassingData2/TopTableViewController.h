//
//  TopTableViewController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputTableViewController.h"
#import "ItemListTableViewController.h"
#import "Product.h"

@interface TopTableViewController : UITableViewController <InputDelegate>

@property (strong, nonatomic) IBOutlet UITableView *TopTableView;
@property (strong, nonatomic) NSArray<NSString *> *productName;
@property (strong, nonatomic) NSMutableArray<Product *> *items;

// Static strings for every label, image, etc.
@property (strong, nonatomic) NSArray<NSString *> *key;
@property (strong, nonatomic) NSArray<NSArray *> *data;

@end
