//
//  Drink.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface Drink : Product

@property BOOL isDrinkDiet;
@property NSInteger drinkSize;

- (id) initWithDrinkID:(NSInteger)drinkID
             drinkName:(NSString*)drinkName
            drinkPrice:(float)drinkPrice
    drinkMadeInCountry:(NSString*)drinkMadeInCountry
           isDrinkDiet:(BOOL)isDrinkDiet
             drinkSize:(NSInteger)drinkSize;

@end
