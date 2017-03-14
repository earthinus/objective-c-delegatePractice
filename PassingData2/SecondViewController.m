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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toHome"]) {
        
        // Get the new view controller
        ViewController *controller = (ViewController *)segue.destinationViewController;
        
        // Pass the selected object to the new view controller.
        controller.textContent = self.textFiled.text;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
