//
//  ViewPromosController.m
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ViewPromosController.h"
#import <Parse/Parse.h>
#import "ViewPromosFromCategoryController.h"

@interface ViewPromosController ()
{
     NSArray *_pickerCategoriesData;
    NSArray *allPromos;
	}
@end

@implementation ViewPromosController


- (void)viewDidLoad {
      self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"13.3.jpg"]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize Data
    _pickerCategoriesData = @[@"Animals", @"White technic", @"Clothes", @"Cars", @"Food", @"Things for home", @"Culture", @"For the kids", @"For the family", @"Cosmetics", @"Computers", @"Smart Phones", @"Photography",@"Fun", @"Chalga", @"Other"];
    
    // Connect data
    self.pickerCategories.dataSource = self;
    self.pickerCategories.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerCategoriesData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerCategoriesData[row];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)swipeBackLeftFromCategory:(UIStoryboardSegue *)segue {
  
}

- (IBAction)showAllFromCategory:(id)sender {
    
      NSString *strPrintRepeat;
      NSInteger row;
    
    
    row = [_pickerCategories selectedRowInComponent:0];
    self.strPrintRepeat = [_pickerCategoriesData objectAtIndex:row];
     NSString *category = self.strPrintRepeat;
//    NSLog(category);
    
    PFQuery *query = [PFQuery queryWithClassName:@"Promotion"];
    [query whereKey:@"Category" equalTo:category];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            
            allPromos = objects;
            
            UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            ViewPromosFromCategoryController *pfc = [sb instantiateViewControllerWithIdentifier:@"PromosFromCategoryNib"];
            pfc.promosFromTheCategory = [[NSArray alloc] init];
            pfc.promosFromTheCategory = objects;
            [self presentViewController:pfc animated:YES completion:nil];
            
            // Do something with the found objects
//            for (PFObject *object in allPromos) {
//                NSLog(@"%@", object[@"Name"]);
//            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    
}

@end
