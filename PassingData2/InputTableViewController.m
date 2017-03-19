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

@property (strong, nonatomic) NSMutableArray *itemAttribute;
@property int itemIndex;

- (void) setItemAttributeArr:(Product *)item;

@end

@implementation InputTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = ((NavigationController *)(self.navigationController)).items;
    self.data = ((NavigationController*)(self.navigationController)).data;
    self.key = ((NavigationController*)(self.navigationController)).key;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arrLabel = [self.data[self.productType] valueForKey:self.key[1]];
    return arrLabel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"InputTableViewCellID";
    InputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[InputTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Set labels
    cell.label.text = [self.data[self.productType] valueForKey:self.key[1]][indexPath.row];
    
    // Set default values to textFields
    if (self.primaryKey == 0) { // from TopView
        cell.textField.text = [self.data[self.productType] valueForKey:self.key[2]][indexPath.row];
        
    } else { // from ItemListView
        
        // TODO: excute the for sentence only once
        for (int i = 0; i < self.items.count; i++) {
            if (self.items[i].primaryKey == self.primaryKey) {
                self.itemIndex = i;
            }
        }
        
        // Set itemAttribute
        if (!self.itemAttribute) {
            [self setItemAttributeArr: self.items[self.itemIndex]];
        }
        cell.textField.text = self.itemAttribute[indexPath.row]; // value of selected item
    }
    return cell;
}

- (void) setItemAttributeArr:(Product *)item {
    
    // for the case of coming from ItemList, create array of values to set textFields as default value.
    if (item.primaryKey == self.primaryKey) {
        if (self.productType == 0) {
            Food *food = (Food *) item;
            self.itemAttribute = [@[[NSString stringWithFormat:@"%ld", (long)food.productID],
                                    food.productName,
                                    [NSString stringWithFormat:@"%.2f", food.productPrice],
                                    food.productMadeInCountry,
                                    [NSString stringWithFormat:@"%ld", (long)food.foodCalorie],
                                    [NSString stringWithFormat:@"%ld", (long)food.foodSize],
                                    food.foodIngredients[0]] mutableCopy];
            
        } else if (self.productType == 1) {
            Drink *drink = (Drink *) item;
            self.itemAttribute = [@[[NSString stringWithFormat:@"%ld", (long)drink.productID],
                                    drink.productName,
                                    [NSString stringWithFormat:@"%.2f", drink.productPrice],
                                    drink.productMadeInCountry,
                                    [NSString stringWithFormat:@"%d", drink.isDrinkDiet],
                                    [NSString stringWithFormat:@"%ld", (long)drink.drinkSize]] mutableCopy];
            
        } else {
            Cloth *cloth = (Cloth *) item;
            self.itemAttribute = [@[[NSString stringWithFormat:@"%ld", (long)cloth.productID],
                                    cloth.productName,
                                    [NSString stringWithFormat:@"%.2f", cloth.productPrice],
                                    cloth.productMadeInCountry,
                                    cloth.clothMaterials[0]] mutableCopy];
        }
    }
}

- (IBAction)sendItem:(id)sender {
    
    Product *item = [[Product alloc] init];
        
    // Get values from each textfield
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSIndexPath *indexPath;
    InputTableViewCell *cell;
    NSArray *arrLable = [self.data[self.productType] valueForKey:self.key[1]];
    for (int i = 0; i < arrLable.count; i++) {
        indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        cell = [self.inputTableView cellForRowAtIndexPath:indexPath];
        [dict setObject:cell.textField.text forKey:[self.data[self.productType] valueForKey:self.key[1]][i]];
    }
    
    // Set the item
    int i = 0;
    NSInteger primaryKey = 0;
    primaryKey = self.items.count + 1;
    if (self.productType == 0) {
        item = [[Food alloc] initWithPrimaryKey:primaryKey
                                         foodID:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] integerValue]
                                       foodName:[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]]
                                      foodPrice:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] floatValue]
                              foodMadeInCountry:[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]]
                                    foodCalorie:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] integerValue]
                                       foodSize:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] integerValue]
                                foodIngredients:@[@"chicken", @"oil", @"chees"]]; // TODO: split by comma
    } else if (self.productType == 1) {
        item = [[Drink alloc] initWithPrimaryKey:primaryKey
                                         drinkID:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] integerValue]
                                       drinkName:[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]]
                                      drinkPrice:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] floatValue]
                              drinkMadeInCountry:[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]]
                                     isDrinkDiet:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] integerValue]
                                       drinkSize:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] integerValue]];
    } else if (self.productType == 2) {
        item = [[Cloth alloc] initWithPrimaryKey:primaryKey
                                         clothID:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] integerValue]
                                       clothName:[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]]
                                      clothPrice:[[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]] floatValue]
                              clothMadeInCountry:[dict valueForKey:[self.data[self.productType] valueForKey:self.key[1]][i++]]
                               clothMaterials:@[@"cotton"]]; // TODO: split by comma
    }
    
    if (self.primaryKey == 0) { // from TopView
        // Add item to NavigationController
        [((NavigationController*)(self.navigationController)).items addObject:item];
        
    } else { // from ItemList
        // Overwrite item to NavigationController
        [((NavigationController*)(self.navigationController)).items replaceObjectAtIndex:self.itemIndex withObject:item];
    }
    
    // Close
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
