//
//  ClothItemTableViewCell.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClothItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *clothImageView;
@property (weak, nonatomic) IBOutlet UILabel *clothNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clothPriceLabel;

@end
