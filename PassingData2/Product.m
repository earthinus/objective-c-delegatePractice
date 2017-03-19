//
//  Product.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id) initWithPrimaryKey:(NSInteger)primaryKey
               productID:(NSInteger)productID
             productName:(NSString*)productName
            productPrice:(float)productPrice
    productMadeInCountry:(NSString*)productMadeInCountry {
    
    self = [super init];
    if (self) {
        self.primaryKey = primaryKey;
        self.productID = productID;
        self.productName = productName;
        self.productPrice = productPrice;
        self.productMadeInCountry = productMadeInCountry;
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
    return self.productPrice;
}

@end
