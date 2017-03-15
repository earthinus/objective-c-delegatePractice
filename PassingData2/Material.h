//
//  Material.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Material : UIViewController

@property int materialCode;
@property (strong, nonatomic) NSString *materialName;

- (id) initWithMaterialCode:(int)materialCode materialName:(NSString*)materialName;

@end
