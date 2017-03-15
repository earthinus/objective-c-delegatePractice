//
//  Food.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface Food : Product

@property NSInteger foodCalorie;
@property NSInteger foodSize;
@property NSArray<NSString *> *foodIngredients;


- (id) initWithFoodID:(NSInteger)foodID foodName:(NSString*)foodName foodPrice:(float)foodPrice foodMadeInCountry:(NSString*)foodMadeInCountry foodCalorie:(NSInteger)foodCalorie foodSize:(NSInteger)foodSize foodIngredients:(NSArray<NSString*>*)foodIngredients;

- (float) price;

@end
