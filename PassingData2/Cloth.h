//
//  Cloth.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "Material.h"

@interface Cloth : Product

@property NSArray<Material*> *clothMaterials;

- (id) initWithClothID:(NSInteger)clothID
             clothName:(NSString*)clothName
            clothPrice:(float)clothPrice
    clothMadeInCountry:(NSString*)clothMadeInCountry
        clothMaterials:(NSArray<Material*>*)clothMaterials;

@end
