//
//  ViewPromosController.h
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPromosController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
- (IBAction)swipeBackLeftFromCategory:(UIStoryboardSegue *)segue;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerCategories;

@end
