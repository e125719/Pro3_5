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
    
    UIButton* btnGood = [self makeButton:CGRectMake(10, 100, 200, 40) text:@"GOOD"];
    [self.view addSubview:btnGood];
    UIButton* btnBad = [self makeButton:CGRectMake(110, 100, 200, 40) text:@"BAD"];
    [self.view addSubview:btnBad];
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
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (IBAction)clickButton:(UIButton*)sender {
    
}

@end
