//
//  ViewPromosController.m
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ViewPromosController.h"

@interface ViewPromosController ()
{
     NSArray *_pickerCategoriesData;
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


@end
