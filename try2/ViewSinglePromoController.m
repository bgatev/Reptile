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

//@synthesize nameLabell;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"17.1.jpg"]];
    
    NSString *name = @"";//_singleNameInView;
    
    NSLog(@"%lu", (unsigned long)_promosFromTheCategorySingle.count);
    
    id selectedPromo;
    
    for (id promo in _promosFromTheCategorySingle) {
        BOOL found =[promo[@"Name"] isEqualToString:_singleNameInView];
        if (found) {
            selectedPromo = promo;
            break;
        }
    }
    name = selectedPromo[@"Name"];
  //  NSLog(@" Name %@", name);
 //   if (name != nil) {
 //       self.nameLabell.text = name;
 //   }
 //   NSLog(@"%@", selectedPromo[@"Name"]);
 //   self.nameLabell.text = _singleNameInView;
  //  NSLog(@"AAAAAA %@",name);
    [self.nameLabell setText:name];
 //   NSLog(@"%@", [name class]);
    //[NSString stringWithString:<#(NSString *)#>:selectedPromo[@"Name"]];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
  //  NSMutableString *wholeString = [[NSMutableString alloc]init];
    
    for (int i = 0; i< name.length; i++) {
        id symbolInAsccii = [NSString stringWithFormat:@"%hu", [name characterAtIndex:i]];
        NSString *string = [NSString stringWithFormat:@"%@", symbolInAsccii];
//        NSLog(@"%@", [symbolInAsccii class]);
        [arr addObject:symbolInAsccii];
        
    }
   name = [NSString stringWithFormat:@"%s", arr];
    self.nameLabell.text = name;
    //    NSLog(@"%hu",[name characterAtIndex:0]);
    NSLog(@"%@", arr);
    int a =5 ;
    
    //  self.nameLabell.text = @"Gosho" ;
    
    
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
