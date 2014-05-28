//
//  DiaryViewController.m
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/21/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import "DiaryViewController.h"


@interface DiaryViewController ()

- (IBAction)btngood:(id)sender;
- (IBAction)btnbad:(id)sender;

@end

@implementation DiaryViewController

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btngood:(id)sender {
    _goodbad = [NSNumber numberWithBool:YES];
    NSLog(@"%@",_goodbad);
}

- (IBAction)btnbad:(id)sender {
    _goodbad = [NSNumber numberWithBool:NO];
    NSLog(@"%@",_goodbad);
}
@end