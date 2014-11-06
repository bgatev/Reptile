//
//  ViewSinglePromoController.h
//  PrImotsiyaApp
//
//  Created by admin on 10/27/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewSinglePromoController : UIViewController

@property NSArray *promosFromTheCategorySingle;

@property NSString *singleNameInView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabell;

@property (weak, nonatomic) IBOutlet UILabel *categoryLabell;

@property (weak, nonatomic) IBOutlet UILabel *priceLabell;

@property (weak, nonatomic) IBOutlet UILabel *moreInfoLabell;


@end
