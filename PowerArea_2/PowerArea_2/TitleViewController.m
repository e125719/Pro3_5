//
//  TitleViewController.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "TitleViewController.h"
#import "AppDelegate.h"
#import "IdEntity.h"

@interface TitleViewController ()

@property (nonatomic, retain) NSManagedObjectContext *manageObjectContext;
- (IBAction)start:(id)sender;
-(NSUInteger *)getCategoryCount;
@end


@implementation TitleViewController


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger *)getCategoryCount
{
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"IdEntity" inManagedObjectContext:self.manageObjectContext]];
    [request setIncludesSubentities:NO];
    
    NSError* error = nil;
    NSUInteger count = [self.manageObjectContext countForFetchRequest:request error:&error];
    if (count == NSNotFound) {
        count = 0;
    }
    
    //ここに問題あり??
    return count;
}


- (IBAction)start:(id)sender {
    
    NSUInteger *counting = [self getCategoryCount];
    
    if (counting == 0) {
        [self performSegueWithIdentifier:@"notdata" sender:self];
    }else{
        [self performSegueWithIdentifier:@"getdata" sender:self];
    }
    
}
@end
