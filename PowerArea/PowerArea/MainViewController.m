//
//  MainViewController.m
//  PowerArea
//
//  Created by Hiroki MATSUMOTO on 5/26/14.
//  Copyright (c) 2014 Hiroki MATSUMOTO. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "Map.h"

@interface MainViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *comLabel;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


- (IBAction)add:(id)sender;
- (IBAction)list:(id)sender;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate* appDelegate  = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)add:(id)sender {
    Map *map = [NSEntityDescription insertNewObjectForEntityForName:@"Map"
                                             inManagedObjectContext:self.managedObjectContext];
    map.title = self.titleLabel.text;
    map.comment = self.comLabel.text;
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }

    self.titleLabel.text = @"";
    self.comLabel.text = @"";
    //  5
    [self.view endEditing:YES];
}

- (IBAction)list:(id)sender {
}

/*#pragma  mark - UITextfield Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.titleLabel]) {
        [self.comLabel becomeFirstResponder];
         }
        return YES;
}*/

@end
