//
//  DiaryViewController.m
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/21/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import "DiaryViewController.h"
#import "fmdb/FMDatabase.h"

@interface DiaryViewController ()

@end

@implementation DiaryViewController

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
    // Do any additional setup after loading the view from its nib.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:36.5946816
                                                            longitude:136.6255726
                                                                 zoom:10];
    GMSMapView* mapView = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    mapView.myLocationEnabled = YES;
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
