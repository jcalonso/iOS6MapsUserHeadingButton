//
//  ViewController.m
//  iOS6MapsUserHeadingButton
//
//  Created by Juan Carlos Alonso on 10/25/12.
//  Copyright (c) 2012 Juan Carlos Alonso. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize userHeadingBtn,mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //User Heading Button states images
    UIImage *buttonImage = [UIImage imageNamed:@"greyButtonHighlight.png"];
    UIImage *buttonImageHighlight = [UIImage imageNamed:@"greyButton.png"];
    UIImage *buttonArrow = [UIImage imageNamed:@"LocationGrey.png"];
    
    //Configure the button
    userHeadingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [userHeadingBtn addTarget:self action:@selector(startShowingUserHeading:) forControlEvents:UIControlEventTouchUpInside];
    //Add state images
    [userHeadingBtn setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [userHeadingBtn setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [userHeadingBtn setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    [userHeadingBtn setImage:buttonArrow forState:UIControlStateNormal];
    
    //Button shadow
    userHeadingBtn.frame = CGRectMake(5,425,39,30);
    userHeadingBtn.layer.cornerRadius = 8.0f;
    userHeadingBtn.layer.masksToBounds = NO;
    userHeadingBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    userHeadingBtn.layer.shadowOpacity = 0.8;
    userHeadingBtn.layer.shadowRadius = 1;
    userHeadingBtn.layer.shadowOffset = CGSizeMake(0, 1.0f);
    
    [self.mapView addSubview:userHeadingBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark User Heading
- (IBAction) startShowingUserHeading:(id)sender{
    
    if(self.mapView.userTrackingMode == 0){
        [self.mapView setUserTrackingMode: MKUserTrackingModeFollow animated: YES];
        
        //Turn on the position arrow
        UIImage *buttonArrow = [UIImage imageNamed:@"LocationBlue.png"];
        [userHeadingBtn setImage:buttonArrow forState:UIControlStateNormal];
        
    }
    else if(self.mapView.userTrackingMode == 1){
        [self.mapView setUserTrackingMode: MKUserTrackingModeFollowWithHeading animated: YES];
        
        //Change it to heading angle
        UIImage *buttonArrow = [UIImage imageNamed:@"LocationHeadingBlue"];
        [userHeadingBtn setImage:buttonArrow forState:UIControlStateNormal];
    }
    else if(self.mapView.userTrackingMode == 2){
        [self.mapView setUserTrackingMode: MKUserTrackingModeNone animated: YES];
        
        //Put it back again
        UIImage *buttonArrow = [UIImage imageNamed:@"LocationGrey.png"];
        [userHeadingBtn setImage:buttonArrow forState:UIControlStateNormal];
    }
    
    
}

- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated{
    if(self.mapView.userTrackingMode == 0){
        NSLog(@"userTrackingMode");
        [self.mapView setUserTrackingMode: MKUserTrackingModeNone animated: YES];
        
        //Put it back again
        UIImage *buttonArrow = [UIImage imageNamed:@"LocationGrey.png"];
        [userHeadingBtn setImage:buttonArrow forState:UIControlStateNormal];
    }
    
}


@end
