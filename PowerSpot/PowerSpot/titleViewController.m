//
//  titleViewController.m
//  PowerSpot
//
//  Created by e125719 on 2014/05/20.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "titleViewController.h"
#import "DiaryViewController.h"

@interface titleViewController ()

@end

@implementation titleViewController

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
    UIButton* btnStart = [self makeButton:CGRectMake(60, 400, 200, 40) text:@"START"];
    [self.view addSubview:btnStart];
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
    DiaryViewController *DiaryView = [[DiaryViewController alloc]initWithNibName:@"DiaryViewController" bundle:nil];
    [self presentViewController:DiaryView animated:YES completion:nil];
}

@end
