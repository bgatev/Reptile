//
//  ViewSinglePromoController.m
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ViewSinglePromoController.h"

@interface ViewSinglePromoController ()


@end

@implementation ViewSinglePromoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"17.1.jpg"]];

    
    for (id promo in _promosFromTheCategorySingle) {
        if (promo[@"Name"]== _singleNameInView) {
            
           // set info

            NSLog(@"PROMO NAME  %@  !!!", promo[@"Name"]);
            NSLog(@"PROMO Category  %@  !!!", promo[@"Category"]);
            NSLog(@"PROMO more info  %@  !!!", promo[@"MoreInfo"]);
            NSLog(@"PROMO NAME  %@  !!!", promo[@"Price"]);
            
            break;
        }
    }
    
    
    
       // Do any additional setup after loading the view.
    
    }




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
