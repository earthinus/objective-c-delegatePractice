//
//  Drink.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Drink.h"

@implementation Drink

- (id) initWithPrimaryKey:(NSInteger)primaryKey
                  drinkID:(NSInteger)drinkID
                drinkName:(NSString*)drinkName
               drinkPrice:(float)drinkPrice
       drinkMadeInCountry:(NSString*)drinkMadeInCountry
              isDrinkDiet:(BOOL)isDrinkDiet
                drinkSize:(NSInteger)drinkSize {
    
    self = [super initWithPrimaryKey:primaryKey
                           productID:drinkID
                         productName:drinkName
                        productPrice:drinkPrice
                productMadeInCountry:drinkMadeInCountry];
    
    if (self) {
        self.isDrinkDiet = isDrinkDiet;
        self.drinkSize = drinkSize;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
