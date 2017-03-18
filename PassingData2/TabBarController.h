//
//  ItemListTabBarController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-16.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface TabBarController : UITabBarController

@property (strong, nonatomic) NSMutableArray<Product *>* items;
@property (strong, nonatomic) NSArray<NSArray *> *data;
@property (strong, nonatomic) NSArray<NSString *> *key;

@end
