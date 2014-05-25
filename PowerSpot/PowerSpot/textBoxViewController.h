//
//  textBoxViewController.h
//  PowerSpot
//
//  Created by e125719 on 2014/05/24.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>

@class textBoxViewController;
@protocol textBoxViewContrillerDelegate

- (void)didCommitButtonClicked:(textBoxViewController*)controller editText:(NSString*)text;
- (void)didCancelButtonClicked:(textBoxViewController*)controller;
- (void)didClearButtonClicked:(textBoxViewController*)controller;

@end

@interface textBoxViewController : UIViewController {
    NSString* btnAttrs;
    IBOutlet UITextField* text;
    IBOutlet UIButton* commitButton;
    IBOutlet UIButton* cancelButton;
    IBOutlet UIButton* clearButton;
    id<textBoxViewContrillerDelegate>delegate;
}

- (IBAction)commitButtonClicked:(id)sender;
- (IBAction)cancelButtonClicked:(id)sender;
- (IBAction)clearButtonClicked:(id)sender;

@property (nonatomic, assign) id<textBoxViewContrillerDelegate>delegate;
@property (nonatomic, retain) NSString* text;

@end
