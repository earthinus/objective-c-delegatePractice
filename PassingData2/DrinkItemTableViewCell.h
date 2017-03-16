//
//  DrinkItemTableViewCell.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinkItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *drinkImageView;
@property (weak, nonatomic) IBOutlet UILabel *drinkNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkSizeLabel;

@end
