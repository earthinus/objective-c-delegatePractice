//
//  NavigationController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-18.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [[NSMutableArray alloc] init];
    
    NSArray<NSString *>
    *dataFoodLabel  = @[@"Food ID", @"Food name", @"Food Price", @"Food made in country", @"Food calorie", @"Food size", @"Food ingredients"],
    *dataFoodValue  = @[@"100", @"Chicken", @"8", @"Canada", @"350", @"4", @"chicken, oil, chees"],
    *dataDrinkLabel = @[@"Drink ID", @"Drink name", @"Drink Price", @"Drink made in country", @"is Drink diet?", @"Drink size"],
    *dataDrinkValue = @[@"412", @"Pepsi", @"2", @"USA", @"NO", @"150"],
    *dataClothLabel = @[@"Cloth ID", @"Cloth name", @"Cloth Price", @"Cloth made in country", @"Cloth Materials"],
    *dataClothValue = @[@"701", @"T-shirt", @"15", @"China", @"Cotton, Nylon"];
    
    self.key = @[@"category", @"label", @"default", @"image"];
    self.data = @[@{self.key[0]:@"Food",
                    self.key[1]:dataFoodLabel,
                    self.key[2]:dataFoodValue,
                    self.key[3]:@"icon_food"},
                  
                  @{self.key[0]:@"Drink",
                    self.key[1]:dataDrinkLabel,
                    self.key[2]:dataDrinkValue,
                    self.key[3]:@"icon_drink"},
                  
                  @{self.key[0]:@"Cloth",
                    self.key[1]:dataClothLabel,
                    self.key[2]:dataClothValue,
                    self.key[3]:@"icon_cloth"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
