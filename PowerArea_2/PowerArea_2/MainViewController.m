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
#import "SpotEntity.h"
#import "Button.h"
#import "IdEntity.h"

#define BTN_GOOD    0
#define BTN_BAD     1
#define BTN_SEND    2

#define BTN_SCHOOL  3
#define BTN_RESTA   4
#define BTN_LEISURE 5
#define BTN_OTHER   6

#define URL @ "http://133.13.60.160/mobile/input"
#define URL2 @ "http://133.13.60.160/mobile/search_form"
#define URL3 @ "http://133.13.60.160/mobile/search"

@interface MainViewController ()<UITextFieldDelegate>

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) IBOutlet UITextField *place;
@property (nonatomic, retain) IBOutlet UITextField *text;

@property (nonatomic, strong) NSNumber *lon;
@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) NSMutableData *receivedData;

@property (nonatomic, strong) NSString *attrs;

@end

@implementation MainViewController

@synthesize locationManager;
@synthesize goodbad = _goodbad;


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
    [self.place setDelegate:self];
    
    btnGood.tag = BTN_GOOD;
    btnGood.layer.borderColor = [UIColor grayColor].CGColor;
    btnGood.layer.borderWidth = 1.0f;
    btnGood.layer.cornerRadius = 7.5f;
    [btnGood setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnGood addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btnBad.tag = BTN_BAD;
    btnBad.layer.borderColor = [UIColor grayColor].CGColor;
    btnBad.layer.borderWidth = 1.0f;
    btnBad.layer.cornerRadius = 7.5f;
    [btnBad setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnBad addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btnSend.tag = BTN_SEND;
    btnSend.layer.borderColor = [UIColor grayColor].CGColor;
    btnSend.layer.borderWidth = 1.0f;
    btnSend.layer.cornerRadius = 7.5f;
    [btnSend addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btnSchool.tag = BTN_SCHOOL;
    btnSchool.layer.borderColor = [UIColor grayColor].CGColor;
    btnSchool.layer.borderWidth = 1.0f;
    btnSchool.layer.cornerRadius = 7.5f;
    [btnSchool addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btnResta.tag = BTN_RESTA;
    btnResta.layer.borderColor = [UIColor grayColor].CGColor;
    btnResta.layer.borderWidth = 1.0f;
    btnResta.layer.cornerRadius = 7.5f;
    [btnResta addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btnLeisure.tag = BTN_LEISURE;
    btnLeisure.layer.borderColor = [UIColor grayColor].CGColor;
    btnLeisure.layer.borderWidth = 1.0f;
    btnLeisure.layer.cornerRadius = 7.5f;
    [btnLeisure addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    btnOther.tag = BTN_OTHER;
    btnOther.layer.borderColor = [UIColor grayColor].CGColor;
    btnOther.layer.borderWidth = 1.0f;
    btnOther.layer.cornerRadius = 7.5f;
    [btnOther addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    locationManager.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
    NSLog(@"%@", self.lon);
    self.lat = [[NSNumber alloc]initWithFloat:latitude];
    NSLog(@"%@", self.lat);
}

- (IBAction)clickButton:(UIButton *)sender {
    
    if (locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = 500;
//    [self.locationManager startUpdatingLocation];
    }
    
    
    if (sender.tag == BTN_GOOD) {
        
        btnGood.alpha = 1.0f;
        [btnGood setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        btnBad.alpha = 0.5f;
        [btnBad setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        NSLog(@"Good");
        _goodbad = [NSNumber numberWithBool:YES];
        
        [self.locationManager startUpdatingLocation];
        
    } else if (sender.tag == BTN_BAD) {
        
        btnBad.alpha = 1.0f;
        [btnBad setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        btnGood.alpha = 0.5f;
        [btnGood setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSLog(@"Bad");
        _goodbad = [NSNumber numberWithBool:NO];
        
    }
    
    if (sender.tag == BTN_SCHOOL) {
        NSLog(@"School");
        
        self.attrs = @"school";
    }
    
    if (sender.tag == BTN_RESTA) {
        NSLog(@"Restaurant");
        
        self.attrs = @"restaurant";
    }
    
    if (sender.tag == BTN_LEISURE) {
        NSLog(@"Leisure");
        
        self.attrs = @"pleasure";
    }
    
    if (sender.tag == BTN_OTHER) {
        NSLog(@"Other");
        
        self.attrs = @"others";
    }
    
    if (sender.tag == BTN_SCHOOL || sender.tag == BTN_RESTA || sender.tag == BTN_LEISURE || sender.tag == BTN_OTHER) {
        SpotEntity *spot = [NSEntityDescription insertNewObjectForEntityForName:@"SpotEntity" inManagedObjectContext:self.managedObjectContext];
        
        spot.latitude = self.lat;
        spot.longitude = self.lon;

        
        NSLog(@"%@", spot.latitude);
        NSLog(@"%@", self.lon);

        NSMutableURLRequest *request2 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL2]];
        
        NSString *body2 = [NSString stringWithFormat:@"latitude=%@&longitude=%@&type=%@", spot.latitude, spot.longitude, self.attrs];
        [request2 setHTTPMethod:@"POST"];
        [request2 setHTTPBody:[body2 dataUsingEncoding:NSUTF8StringEncoding]];
        
        //NSLog(@"spotX=%@, spotY=%@", spotX, spotY);
        
        NSURLResponse *response;
        NSError *err = nil;
        NSData *result = [NSURLConnection sendSynchronousRequest:request2 returningResponse:&response error:&err];
        
        NSString *ket = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        NSLog(@"%@", ket);
        NSLog(@"%@", self.attrs);
        
        
        NSArray *array = [ket componentsSeparatedByString:@"\n"];
        NSLog(@"%@",array[62]);
        
        self.place.text = array[62];
    }
    
    if (sender.tag == BTN_SEND) {
        
        NSLog(@"Send");
        
        MapDataEntity *map = [NSEntityDescription insertNewObjectForEntityForName:@"MapDataEntity" inManagedObjectContext:self.managedObjectContext];
        
        NSManagedObjectContext *moc = [self managedObjectContext];
        NSFetchRequest *request_2 = [[NSFetchRequest alloc] init];
        NSEntityDescription *d = [NSEntityDescription entityForName: @"IdEntity" inManagedObjectContext:self.managedObjectContext];
        [request_2 setEntity:d];
        
        NSError *er = nil;
        NSArray *list = [moc executeFetchRequest:request_2 error:&er];
        NSManagedObject *resultObject = [list objectAtIndex:0];
        
        NSString *result_name = [resultObject valueForKey:@"user"];
        NSString *result_pass = [resultObject valueForKey:@"pass"];
        
        
        map.title = self.place.text;
        map.descriptions = self.text.text;
        
        if (btnGood.alpha == 1.0f) {
            map.status = @"good";
        } else {
            map.status = @"bad";
        }
        
        map.longitude = self.lon;
        map.latitude = self.lat;
        map.userid = result_name;
        map.password = result_pass;
        
        NSLog(@"%@,%@,%@,%@,%@,%@,%@", map.title,map.descriptions,map.status,map.longitude,map.latitude,map.userid,map.password);
        
        NSError *error;
        
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"miss");
        }
        
        self.place.text = @"";
        self.text.text = @"";
        
        
        [self.view endEditing:YES];
        
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL]];
        NSString *body = [NSString stringWithFormat:@"title=%@&description=%@&status=%@&longitude=%@&latitude=%@&userid=%@&password=%@", map.title, map.descriptions, map.status, map.longitude, map.latitude, map.userid, map.password];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
        NSLog(@"complete");
        
    }

}

@end
