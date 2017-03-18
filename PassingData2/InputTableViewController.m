//
//  InputTableViewController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "InputTableViewController.h"
#import "NavigationController.h"

@interface InputTableViewController ()

@end

@implementation InputTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = ((NavigationController*)(self.navigationController)).data;
    self.key = ((NavigationController*)(self.navigationController)).key;
    
    // Get the index of selected row of TopViewController
    for (int i = 0; i < self.data.count; i++) {
        if ([self.selectedProduct isEqualToString:[self.data[i] valueForKey:self.key[0]]]) {
            self.index = i;
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arrLabel = [self.data[self.index] valueForKey:self.key[1]];
    return arrLabel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"InputTableViewCellID";
    InputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[InputTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.label.text = [self.data[self.index] valueForKey:self.key[1]][indexPath.row];
    cell.textField.text = [self.data[self.index] valueForKey:self.key[2]][indexPath.row];
    return cell;
}


- (IBAction)sendItem:(id)sender {
    
    Product *item = [[Product alloc] init];
    
    if ([self.delegate respondsToSelector:@selector(showSumPrice:)]) {
        
        // Get values from each textfield
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSIndexPath *indexPath;
        InputTableViewCell *cell;
        NSArray *arrLable = [self.data[self.index] valueForKey:self.key[1]];
        
        for (int i = 0; i < arrLable.count; i++) {
            indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            cell = [_inputTableView cellForRowAtIndexPath:indexPath];
            [dict setObject:cell.textField.text forKey:[self.data[self.index] valueForKey:self.key[1]][i]];
        }
        
        if (self.index == 0) {
            int i = 0;
            item = [[Food alloc] initWithFoodID:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                            foodName:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                           foodPrice:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] floatValue]
                                   foodMadeInCountry:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                         foodCalorie:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                            foodSize:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                     foodIngredients:@[@"chicken", @"oil", @"chees"]]; // TODO: split by comma
        } else if (self.index == 1) {
            int i = 0;
            item = [[Drink alloc] initWithDrinkID:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                             drinkName:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                            drinkPrice:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] floatValue]
                                    drinkMadeInCountry:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                           isDrinkDiet:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                             drinkSize:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]];
        } else if (self.index == 2) {
            int i = 0;
            item = [[Cloth alloc] initWithClothID:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                             clothName:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                            clothPrice:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] floatValue]
                                    clothMadeInCountry:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                        clothMaterials:@[@"cotton"]]; // TODO: split by comma
        }
    }
    
    // Send item to NavigationController
    [((NavigationController*)(self.navigationController)).items addObject:item];
    
    // Show sum price on TopViewController
    [self.delegate showSumPrice:item];
    
    // Add badge on TabBarButton
    [self.delegate addBadge];
    
    // Close
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
