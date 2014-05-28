//
//  MapViewController.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/28.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mapView = [[MKMapView alloc] init];
    [mapView setFrame:self.view.frame];
    [mapView setMapType:MKMapTypeStandard];
    [mapView setDelegate:self];
    [self.view addSubview:mapView];
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|
                               UIViewAutoresizingFlexibleTopMargin|
                               UIViewAutoresizingFlexibleLeftMargin|
                               UIViewAutoresizingFlexibleBottomMargin|
                               UIViewAutoresizingFlexibleWidth|
                               UIViewAutoresizingFlexibleHeight;
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 40.689167;
    coordinate.longitude = -74.044444;
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    [mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    NSLog(@"Success");
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    NSLog(@"Fail");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
