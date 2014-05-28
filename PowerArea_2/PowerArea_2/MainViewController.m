//
//  MainViewController.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "MapDataEntity.h"

#define BTN_GOOD    0
#define BTN_BAD     1
#define BTN_SEND    2
#define URL @ "http://133.13.60.160/mobile/post"

@interface MainViewController ()<UITextFieldDelegate>

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) IBOutlet UITextField *place;
@property (nonatomic, retain) IBOutlet UITextField *text;

@property (nonatomic, strong) NSNumber *lon;
@property (nonatomic, strong) NSNumber *lat;

@end

@implementation MainViewController

@synthesize locationManager;
@synthesize goodbad = _goodbad;
@synthesize usid = _usid;
@synthesize pass = _pass;


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
    
    [self.text setDelegate:self];
    
     btnSend.tag = BTN_SEND;
    
    btnGood.tag = BTN_GOOD;
    btnBad.tag = BTN_BAD;
    
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
    
    self.lon = [[NSNumber alloc]initWithFloat:longitude];
    self.lat = [[NSNumber alloc]initWithFloat:latitude];
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
        _goodbad = [NSNumber numberWithBool:YES];
        
    } else if (sender.tag == BTN_BAD) {
        
        btnBad.alpha = 1.0f;
        [btnBad setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        btnGood.alpha = 0.5f;
        [btnGood setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSLog(@"Bad");
        _goodbad = [NSNumber numberWithBool:NO];
        
    }
    
    if (sender.tag == BTN_SEND) {
        
        NSLog(@"Send");
        
        MapDataEntity *map = [NSEntityDescription insertNewObjectForEntityForName:@"MapDataEntity" inManagedObjectContext:self.managedObjectContext];
        
        map.title = self.place.text;
        map.descriptions = self.text.text;
        if (btnGood.alpha == 1.0f) {
            map.status = @"good";
        }else{
            map.status = @"bad";
        }
        map.longitude = self.lon;
        map.latitude = self.lat;
        map.userid = @"hoge";
        map.password = @"hogehoge";
        
        NSString *lati = [self.lat stringValue];
        NSString *tek = [self.lon stringValue];
        
        NSError *error;
        
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"miss");
        }
        
        self.place.text = @"";
        self.text.text = @"";
        
        
        [self.view endEditing:YES];
        
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL]];
        NSString *body = [NSString stringWithFormat:@"title=%@&description=%@&status=%@&longitude=%@&latitude=%@&userid=%@&password=%@", map.title, map.descriptions, map.status, tek, lati, map.userid, map.password];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
        [locationManager stopUpdatingLocation];
        locationManager = nil;
    }
}

@end
