//
//  ViewController.m
//  try2
//
//  Created by admin on 10/26/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"13.3.jpg"]];
    
    PFObject *testObject = [PFObject objectWithClassName:@"Promotions"];
    testObject[@"City"] = @"Sofia";
    [testObject saveInBackground];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeBackLeft:(UIStoryboardSegue *)segue {
    
   
}

- (IBAction)swipeBackRight:(UIStoryboardSegue *)otherSegue {
    
  
}

@end
