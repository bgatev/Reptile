//
//  ViewCreatePromoController.h
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewCreatePromoController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UITextField *nameInput;

@property (weak, nonatomic) IBOutlet UITextField *moreInfoInput;

@property (weak, nonatomic) IBOutlet UITextField *priceInput;

@property (weak, nonatomic) IBOutlet UITextField *shopInput;
- (IBAction)createPromo:(id)sender;

@property (weak, nonatomic) NSString* strPrintRepeat;

// add geo point
// add pic

@end