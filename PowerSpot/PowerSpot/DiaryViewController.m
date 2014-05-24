//
//  DiaryViewController.m
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/21/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import "DiaryViewController.h"
#import "goodViewController.h"
#import "badViewController.h"
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
    
    UIButton* btnGood = [self makeButton:CGRectMake(50, 100, 100, 40) text:@"GOOD"];
    [self.view addSubview:btnGood];
    [btnGood addTarget:self action:@selector(pushGoodButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btnBad = [self makeButton:CGRectMake(170, 100, 100, 40) text:@"BAD"];
    [self.view addSubview:btnBad];
    [btnBad addTarget:self action:@selector(pushBadButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton*)makeButton:(CGRect)rect text:(NSString*)text {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:rect];
    [button setTitle:text forState:UIControlStateNormal];
    
    return button;
}

- (IBAction)pushGoodButton:(UIButton*)sender {
    goodViewController* GOOD = [[goodViewController alloc] initWithNibName:@"goodViewController" bundle:nil];
    [self presentViewController:GOOD animated:YES completion:nil];
}

- (IBAction)pushBadButton:(id)sender {
    badViewController* BAD = [[badViewController alloc] initWithNibName:@"badViewController" bundle:nil];
    [self presentViewController:BAD animated:YES completion:nil];
}

@end