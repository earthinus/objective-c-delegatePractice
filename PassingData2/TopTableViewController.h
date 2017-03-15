//
//  TopTableViewController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *TopTableView;
@property (strong, nonatomic) NSArray<NSString *> *productName;

// Static strings for every label, image, etc.

@property (strong, nonatomic) NSArray<NSString *> *key;
@property (strong, nonatomic) NSArray<NSArray *> *data;

@end
