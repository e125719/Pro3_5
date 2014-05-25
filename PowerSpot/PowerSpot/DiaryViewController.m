//
//  DiaryViewController.m
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/21/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import "DiaryViewController.h"
#import "ListTableViewController.h"
#import "ShowTableViewController.h"

@interface DiaryViewController ()

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
    // Do any additional setup after loading the view from its nib.
    UIButton* btnGood = [self makeButton:CGRectMake(50, 100, 100, 40) text:@"GOOD"];
    [self.view addSubview:btnGood];
    [btnGood addTarget:self action:@selector(pushGoodButton:) forControlEvents:UIControlEventTouchUpInside];

    UIButton* btnBad = [self makeButton:CGRectMake(170, 100, 100, 40) text:@"BAD"];
    [self.view addSubview:btnBad];
    [btnBad addTarget:self action:@selector(pushBadButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* list = [self makeButton:CGRectMake(110, 250, 100, 40) text:@"LIST"];
    [self.view addSubview:list];
    [list addTarget:self action:@selector(pushListButton:) forControlEvents:UIControlEventTouchUpInside];

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

- (IBAction)pushGoodButton:(id)sender {
    ShowTableViewController* GOOD = [[ShowTableViewController alloc] initWithNibName:@"ShowTableViewController" bundle:nil];
    [self presentViewController:GOOD animated:YES completion:nil];
    
    _goodbad = [NSNumber numberWithBool:YES];
    NSLog(@"%@", _goodbad);
}

- (IBAction)pushBadButton:(id)sender {
    ShowTableViewController* BAD = [[ShowTableViewController alloc] initWithNibName:@"ShowTableViewController" bundle:nil];
    [self presentViewController:BAD animated:YES completion:nil];
    
    _goodbad = [NSNumber numberWithBool:NO];
     NSLog(@"%@", _goodbad);
}

- (IBAction)pushListButton :(id)sender {
    ListTableViewController* slist = [[ListTableViewController alloc]initWithNibName:@"ListTableViewController" bundle:nil];
    [self presentViewController:slist animated:YES completion:nil];
}

@end