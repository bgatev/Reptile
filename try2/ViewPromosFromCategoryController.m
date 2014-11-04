//
//  ViewPromosFromCategoryController.m
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//
#import "ViewSinglePromoController.h"
#import "ViewPromosFromCategoryController.h"

@interface ViewPromosFromCategoryController ()
{
  NSArray *_pickerData;
}

@end

@implementation ViewPromosFromCategoryController

- (void)viewDidLoad {
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"13.3.jpg"]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", [self.promosFromTheCategory componentsJoinedByString:@", "]);
    
    for (id item in _promosFromTheCategory) {
       // NSLog(@"%@", item[@"Name"]);
        [names addObject:item[@"Name"]];
    }
    
    // Initialize Data
    if (names.count == 0){
        _pickerData = @[@"No promos in this category."];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No promos in this category." message:@"Please, swipe up to go back." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [alert show];
    }
    else
    {
    _pickerData = names;
    }
    
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
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
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (IBAction)swipeBackLeftToPromosFromCategory:(UIStoryboardSegue *)segue {
   
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showSinglePromo:(id)sender {

    NSString *singleName;
    NSInteger row;
    //  NSArray *repeatPickerData;
    // UIPickerView *repeatPickerView;
    
    row = [_picker selectedRowInComponent:0];
    self.strPrintRepeat = [_pickerData objectAtIndex:row];
    
    singleName = self.strPrintRepeat;
  //  NSLog(@"%@",singleName);
    
    
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewSinglePromoController *pfc = [sb instantiateViewControllerWithIdentifier:@"SinglePromoNib"];
    
    pfc.promosFromTheCategorySingle = [[NSArray alloc] init];
    pfc.promosFromTheCategorySingle = _promosFromTheCategory;
    pfc.singleNameInView = singleName;
   [self presentViewController:pfc animated:YES completion:nil];
    
   
}
@end
