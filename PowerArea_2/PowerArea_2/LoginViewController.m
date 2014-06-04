//
//  LoginViewController.m
//  PowerArea_2
//
//  Created by Hiroki MATSUMOTO on 5/31/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "IdEntity.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, retain) NSManagedObjectContext *manageObjectContext;

@property (retain, nonatomic) IBOutlet UITextField *userT;
@property (retain, nonatomic) IBOutlet UITextField *passT;


@end

@implementation LoginViewController


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
    AppDelegate *appdele = [UIApplication sharedApplication].delegate;
    self.manageObjectContext = appdele.manageObjectContext;
    
    [self.passT setDelegate:self];
    self.passT.secureTextEntry = YES;
    
    [btnlogin addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
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


- (IBAction)clickButton:(id)sender{
    
    IdEntity *iden = [NSEntityDescription insertNewObjectForEntityForName:@"IdEntity" inManagedObjectContext:self.manageObjectContext];

    iden.user = self.userT.text;
    iden.pass = self.passT.text;

    NSError *error;
    if (![self.manageObjectContext save:&error]) {
        NSLog(@"miss");
    }

    [self.view endEditing:YES];
    [self performSegueWithIdentifier:@"loginok" sender:self];

}

@end
