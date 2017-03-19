//
//  Material.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "Material.h"

@implementation Material

- (id) initWithMaterialCode:(int)materialCode materialName:(NSString*)materialName {
    
    self = [super init];
    if (self) {
        self.materialCode = materialCode;
        self.materialName = materialName;
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
