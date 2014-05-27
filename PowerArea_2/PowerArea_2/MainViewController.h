//
//  MainViewController.h
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController<CLLocationManagerDelegate> {
    IBOutlet UIButton *btnGood;
    IBOutlet UIButton *btnBad;
    IBOutlet UIButton *btnSend;
    
    IBOutlet UITextField *text;
}

@property (nonatomic, retain) CLLocationManager *locationManager;

- (IBAction)clickButton:(UIButton *)sender;

@end
