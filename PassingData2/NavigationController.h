//
//  NavigationController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-18.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface NavigationController : UINavigationController

@property (strong, nonatomic) NSMutableArray<Product *>* items;
@property (strong, nonatomic) NSArray<NSArray *> *data;
@property (strong, nonatomic) NSArray<NSString *> *key;

@end
