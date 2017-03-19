//
//  InputTableViewController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputTableViewCell.h"
#import "Food.h"
#import "Drink.h"
#import "Cloth.h"

@protocol InputDelegate <NSObject>

- (void) showSumPrice:(Product *)item;

- (void) addBadge;

@end

@interface InputTableViewController : UITableViewController

@property (weak, nonatomic) id<InputDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *inputTableView;
@property (strong, nonatomic) IBOutlet NSMutableArray<Product *> *items;
@property (strong, nonatomic) NSArray<NSArray *> *data;
@property (strong, nonatomic) NSArray<NSString *> *key;
@property (strong, nonatomic) NSString *selectedProduct;
@property NSInteger productType;
@property NSInteger primaryKey;

@end
