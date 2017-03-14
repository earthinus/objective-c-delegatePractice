//
//  SecondViewController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-13.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.text = self.textContent;
    self.textFiled.text = self.textContent;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)passToHome:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(passData:)]){
        [self.delegate passData:self.textFiled.text];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
