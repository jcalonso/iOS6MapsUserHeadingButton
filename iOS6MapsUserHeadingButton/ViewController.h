//
//  ViewController.h
//  iOS6MapsUserHeadingButton
//
//  Created by Juan Carlos Alonso on 10/26/12.
//  Copyright (c) 2012 Juan Carlos Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *userHeadingBtn;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
