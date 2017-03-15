//
//  Product.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id) initWithProductID:(NSInteger)productID
             productName:(NSString*)productName
            productPrice:(float)productPrice
    productMadeInCountry:(NSString*)productMadeInCountry {
    
    self = [super init];
    if (self) {
        self.productID = productID;
        self.productName = productName;
        self.productPrice = productPrice;
        self.productMadeInCountry = productMadeInCountry;
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


- (float) price {
    return self.productPrice;
}

@end
