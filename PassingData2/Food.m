//
//  Food.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Food.h"

@implementation Food

- (id) initWithPrimaryKey:(NSInteger)primaryKey
                   foodID:(NSInteger)foodID
                 foodName:(NSString*)foodName
                foodPrice:(float)foodPrice
        foodMadeInCountry:(NSString*)foodMadeInCountry
              foodCalorie:(NSInteger)foodCalorie
                 foodSize:(NSInteger)foodSize
          foodIngredients:(NSArray<NSString*>*)foodIngredients {
    
    self = [super initWithPrimaryKey:primaryKey
                           productID:foodID
                         productName:foodName
                        productPrice:foodPrice
                productMadeInCountry:foodMadeInCountry];
    
    if (self) {
        self.foodCalorie = foodCalorie;
        self.foodSize = foodSize;
        self.foodIngredients = foodIngredients;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (float) price {
    return self.productPrice * self.foodSize;
}

@end
