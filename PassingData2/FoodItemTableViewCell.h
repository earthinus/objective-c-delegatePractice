//
//  FoodItemTableViewCell.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodSumPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodSizeLabel;

@end
