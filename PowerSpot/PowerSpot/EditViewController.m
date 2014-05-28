//
//  EditViewController.m
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/25/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textf;
@property (weak, nonatomic) IBOutlet UIDatePicker *datap;

@property (nonatomic, readonly, getter = isEditingdData) BOOL editdata;


@end

@implementation EditViewController{
    BOOL _hasEditDate;
    BOOL _editdata;
}

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
    
    self.title = self.editName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Configure the user interface according to state.
    if (self.editdata) {
        
        self.textf.hidden = YES;
        self.datap.hidden = NO;
        NSDate *date = [self.editObject valueForKey:self.editKey];
        if (date == nil) {
            date = [NSDate date];
        }
        self.datap.date = date;
    }
    else {
        
        self.textf.hidden = NO;
        self.datap.hidden = YES;
        self.textf.text = [self.editObject valueForKey:self.editKey];
        self.textf.placeholder = self.title;
        [self.textf becomeFirstResponder];
    }

}

- (IBAction)save:(id)sender
{
    // Set the action name for the undo operation.
    NSUndoManager * undoManager = [[self.editObject managedObjectContext] undoManager];
    [undoManager setActionName:[NSString stringWithFormat:@"%@", self.editName]];
    
    // Pass current value to the edited object, then pop.
    if (self.editdata) {
        [self.editObject setValue:self.datap.date forKey:self.editKey];
    }
    else {
        [self.editObject setValue:self.textf.text forKey:self.editKey];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)cancel:(id)sender
{
    // Don't pass current value to the edited object, just pop.
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)editdata
{
    if (_hasEditDate == YES) {
        return _editdata;
    }
    
    NSEntityDescription *entity = [self.editObject entity];
    NSAttributeDescription *attribute = [entity attributesByName][self.editKey];
    NSString *attributeClassName = [attribute attributeValueClassName];
    
    if ([attributeClassName isEqualToString:@"NSDate"]) {
        _editdata = YES;
    }
    else {
        _editdata = NO;
    }
    
    _hasEditDate = YES;
    return _editdata;
}



@end
