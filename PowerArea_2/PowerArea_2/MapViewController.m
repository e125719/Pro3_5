//
//  MapViewController.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/28.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "MapViewController.h"
#import "MainViewController.h"
#import "MapDataEntity.h"
#import "AppDelegate.h"

@interface MapViewController ()

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

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
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = delegate.manageObjectContext;
    
    _latitude = 0.0f;
    _longitude = 0.0f;
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    if ([CLLocationManager locationServicesEnabled]) {
        [_locationManager startUpdatingLocation];
    }
    
    mapView = [[MKMapView alloc] init];
    [mapView setFrame:self.view.frame];
//    [mapView setMapType:MKMapTypeStandard];
    [mapView setMapType:MKMapTypeSatellite];
    [mapView setDelegate:self];
    [self.view addSubview:mapView];
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleWidth|
    UIViewAutoresizingFlexibleHeight;
    
    //[self locationManager];
    
    NSManagedObjectContext *moc = [self managedObjectContext];
    NSFetchRequest *request_2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *d = [NSEntityDescription entityForName: @"MapDataEntity" inManagedObjectContext:self.managedObjectContext];
    [request_2 setEntity:d];
    
    NSError *er = nil;
    NSArray *list = [moc executeFetchRequest:request_2 error:&er];
    NSManagedObject *resultObject = [list objectAtIndex:0];
    
    NSNumber *result_lon = [resultObject valueForKey:@"longitude"];
    NSNumber *result_lat = [resultObject valueForKey:@"latitude"];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [result_lat floatValue];
    coordinate.longitude = [result_lon floatValue];
    NSLog(@"_latitude = %f, _longitude = %f", _latitude, _longitude);
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    [mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    CLLocationCoordinate2D coordinating = newLocation.coordinate;
    _latitude = coordinating.latitude;
    _longitude = coordinating.longitude;
    NSLog(@"coordinating.latitude = %f\ncoordinating.longitude = %f",coordinating.latitude, coordinating.longitude);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [_locationManager stopUpdatingLocation];
    
    _locationManager.delegate = nil;
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
