//
//  ViewCreatePromoController.m
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ViewCreatePromoController.h"
#import <Parse/Parse.h>

@interface ViewCreatePromoController ()
{
     NSArray *_pickerData;
}
@end

@implementation ViewCreatePromoController

- (void)viewDidLoad {
   
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"17.1.jpg"]];
    
    [super viewDidLoad];
    
    // Add categories
    _pickerData = @[@"Animals", @"White technic", @"Clothes", @"Cars", @"Food", @"Things for home", @"Culture", @"For the kids", @"For the family", @"Cosmetics", @"Computers", @"Smart Phones", @"Photography",@"Fun", @"Chalga", @"Other"];
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//For the picker
// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}


- (IBAction)createPromo:(id)sender{
   // NSString *strPrintRepeat;
    NSInteger row;
  //  NSArray *repeatPickerData;
   // UIPickerView *repeatPickerView;
    
    row = [_picker selectedRowInComponent:0];
    self.strPrintRepeat = [_pickerData objectAtIndex:row];
    
    //take info from the input fields
    NSString *name = _nameInput.text;
    NSString *info = _moreInfoInput.text;
    NSString *category = self.strPrintRepeat;
     double price = _priceInput.text.doubleValue;
    NSNumber *priceNumber = [NSNumber numberWithDouble:price];
    
    //Validate input info
    if(name == nil || name.length <=3 || name.length>=30){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid name." message:@"It should be between 3 and 30 characters long." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [alert show];
        _nameInput.text = @"";
    }
   else if(price <= 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid price." message:@"It should be a positive number." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [alert show];
       _priceInput.text = @"";
    }
  else
    {
        //add in database
      PFObject *newPromo = [PFObject objectWithClassName:@"Promotion"];
     newPromo[@"Name"] = name;
       newPromo[@"Category"] = category;
       newPromo[@"Price"] = priceNumber;
       newPromo[@"MoreInfo"] = info;
     //   newPromo[@"Picture"] = @"17.1.jpg";
    // newPromo[@"Shop"] = geo;
        
      [newPromo saveInBackground];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your promotion is added successfully!" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
    [alert show];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
