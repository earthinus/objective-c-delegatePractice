//
//  SecondViewController.h
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-13.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondeDelegate <NSObject>

- (void) passData:(NSString *)data;

@end


@interface SecondViewController : UIViewController


@property (weak, nonatomic) id<SecondeDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (strong, nonatomic) NSString *textContent;

@end
