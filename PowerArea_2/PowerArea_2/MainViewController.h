//
//  MainViewController.h
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController<CLLocationManagerDelegate>{
    IBOutlet UIButton *btnSend;
    IBOutlet UIButton *btnGood;
    IBOutlet UIButton *btnBad;

}

@property (nonatomic, strong) NSNumber *goodbad;


@property (nonatomic, retain) CLLocationManager *locationManager;

- (IBAction)clickButton:(UIButton *)sender;

@end
