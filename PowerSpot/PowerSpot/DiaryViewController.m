//
//  DiaryViewController.m
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/21/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import "DiaryViewController.h"
#import "textViewController.h"
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
    
    UIButton* btnBad = [self makeButton:CGRectMake(170, 100, 100, 40) text:@"BAD"];
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
    [button addTarget:self action:@selector(actionButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (IBAction)actionButton:(UIButton*)sender {
    textViewController* TextView = [[textViewController alloc] initWithNibName:@"textViewController" bundle:nil];
    [self presentViewController:TextView animated:YES completion:nil];
}

@end