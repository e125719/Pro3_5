//
//  MapViewController.h
//  PowerArea_2
//
//  Created by e125719 on 2014/05/28.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    MKMapView *mapView;
    CLLocationManager* _locationManager;
    CLLocationDegrees _latitude;
    CLLocationDegrees _longitude;
}

@end
