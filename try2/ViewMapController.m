//
//  ViewMapController.m
//  PrImotsiyaApp
//
//  Created by admin on 11/6/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ViewMapController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewMapController ()

@end

@implementation ViewMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:42.7
                                                            longitude:23.3
                                                                 zoom:6];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    marker.snippet = @"Hello World";
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = mapView;
    // Do any additional setup after loading the view.
    
    self.view = mapView;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate

{
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    marker3.position = coordinate;
    marker3.title = @"170 Asbury Anderson Rd";
    marker3.snippet = @"US";
    marker3.map = mapView;
    
    NSLog(@"Added");
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
