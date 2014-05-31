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

@end

NSInteger count;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)countUnreadItems {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"IdEntity" inManagedObjectContext:self.manageObjectContext]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@" read = 0"];
    [request setPredicate:predicate];
    
    
    NSError *err;
    count = [self.manageObjectContext countForFetchRequest:request error:&err];
    if(count == NSNotFound) {
        NSLog(@"Error");
    }
    
    NSLog(@"%d", count);
    return count;
}



- (IBAction)start:(id)sender {
    
    if (count == 0) {
        [self performSegueWithIdentifier:@"notdata" sender:self];
    }else{
        [self performSegueWithIdentifier:@"getdata" sender:self];
    }
    
}
@end
