//
//  InputTableViewController.m
//  PassingData2
//
//  Created by 戸田 真紀 on 2017-03-14.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "InputTableViewController.h"
#import "TopTableViewController.h"
#import "Food.h"
#import "Drink.h"
#import "Cloth.h"

@interface InputTableViewController ()

@property (strong, nonatomic) Product *item;
@property NSInteger index;

@end

@implementation InputTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get the index of selected row of TopViewController
    for (int i = 0; i < self.data.count; i++) {
        NSLog(@"%@", [self.data[i] valueForKey:self.key[0]]);
        if ([self.selectedProduct isEqualToString:[self.data[i] valueForKey:self.key[0]]]) {
            self.index = i;
            break;
        }
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    //if ([self.delegate respondsToSelector:@selector(item:)]) {
        
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
            self.item = [[Food alloc] initWithFoodID:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                            foodName:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                           foodPrice:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] floatValue]
                                   foodMadeInCountry:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                         foodCalorie:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                            foodSize:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                     foodIngredients:@[@"chicken", @"oil", @"chees"]]; // TODO: split by comma
        } else if (self.index == 1) {
            int i = 0;
            self.item = [[Drink alloc] initWithDrinkID:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                             drinkName:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                            drinkPrice:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] floatValue]
                                    drinkMadeInCountry:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                           isDrinkDiet:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                             drinkSize:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]];
        } else if (self.index == 2) {
            int i = 0;
            self.item = [[Cloth alloc] initWithClothID:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] integerValue]
                                             clothName:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                            clothPrice:[[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]] floatValue]
                                    clothMadeInCountry:[dict valueForKey:[self.data[self.index] valueForKey:self.key[1]][i++]]
                                        clothMaterials:@[@"cotton"]]; // TODO: split by comma
        }
    //}
    
    //[self.delegate item:self.item];
    
    [[self navigationController] popViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
