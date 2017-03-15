//
//  Product.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Product : UIViewController

@property NSInteger productID;
@property (strong, nonatomic) NSString *productName,
*productMadeInCountry;
@property float productPrice;


- (id) initWithProductID:(NSInteger)productID
             productName:(NSString*)productName
            productPrice:(float)productPrice
    productMadeInCountry:(NSString*)productMadeInCountry;

- (float) price;

@end
