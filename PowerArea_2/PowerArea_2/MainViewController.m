//
//  MainViewController.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "MainViewController.h"

#define BTN_GOOD    0
#define BTN_BAD     1
#define BTN_SEND    2

@interface MainViewController ()<UITextFieldDelegate>

@end

@implementation MainViewController

@synthesize locationManager;

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
    [text setDelegate:self];
    
    btnGood.tag = BTN_GOOD;
    btnBad.tag = BTN_BAD;
    btnSend.tag = BTN_SEND;
    
    [btnGood setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnGood addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [btnBad setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnBad addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [btnSend addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    
    float latitude = location.coordinate.latitude;
    float longitude = location.coordinate.longitude;
    
    if (latitude < 0.0) {
        latitude += 360.0;
    }
    
    if (longitude < 0.0) {
        longitude += 360.0;
    }
    
    NSLog(@"Get coordinate\n");
    NSLog(@"Lati = %f, Long = %f",latitude,longitude);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)clickButton:(UIButton *)sender {
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        
        locationManager.distanceFilter = 500;
        
        [locationManager startUpdatingLocation];
    }
    
    if (sender.tag == BTN_GOOD) {
        btnGood.alpha = 1.0f;
        [btnGood setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        btnBad.alpha = 0.5f;
        [btnBad setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        NSLog(@"Good");
    } else if (sender.tag == BTN_BAD) {
        btnBad.alpha = 1.0f;
        [btnBad setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        btnGood.alpha = 0.5f;
        [btnGood setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSLog(@"Bad");
    }
    
    if (sender.tag == BTN_SEND) {
        NSLog(@"Send");
    }
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
