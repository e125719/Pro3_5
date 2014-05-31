//
//  PickerViewController.h
//  PowerArea_2
//
//  Created by e125719 on 2014/05/31.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) IBOutlet UIPickerView *picker;
@property (nonatomic, weak) IBOutlet UIButton *closeButton;

//@property (nonatomic, weak) id<PickerViewControllerDelegate> delegate;

- (IBAction)closePickerView:(id)sender;

@end

@protocol PickerViewControllerDelegate <NSObject>

- (void)applySelectedString:(NSString *)str;
- (void)closePickerView:(PickerViewController *)controller;

@end