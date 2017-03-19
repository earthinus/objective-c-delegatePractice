//
//  Cloth.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Cloth.h"

@implementation Cloth

- (id) initWithPrimaryKey:(NSInteger)primaryKey
                  clothID:(NSInteger)clothID
                clothName:(NSString*)clothName
               clothPrice:(float)clothPrice
       clothMadeInCountry:(NSString*)clothMadeInCountry
           clothMaterials:(NSArray<Material*>*)clothMaterials {
    
    self = [super initWithPrimaryKey:primaryKey
                           productID:clothID
                         productName:clothName
                        productPrice:clothPrice
                productMadeInCountry:clothMadeInCountry];
    
    if (self) {
        self.clothMaterials = clothMaterials;
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
