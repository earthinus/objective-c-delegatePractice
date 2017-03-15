//
//  Drink.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Drink.h"

@implementation Drink

- (id) initWithDrinkID:(NSInteger)drinkID
             drinkName:(NSString*)drinkName
            drinkPrice:(float)drinkPrice
    drinkMadeInCountry:(NSString*)drinkMadeInCountry
           isDrinkDiet:(BOOL)isDrinkDiet
             drinkSize:(NSInteger)drinkSize {
    
    self = [super initWithProductID:drinkID productName:drinkName productPrice:drinkPrice productMadeInCountry:drinkMadeInCountry];
    
    if (self) {
        self.isDrinkDiet = isDrinkDiet;
        self.drinkSize = drinkSize;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
