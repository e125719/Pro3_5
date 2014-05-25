//
//  EditViewController.h
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/25/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController

@property (nonatomic, strong) NSManagedObject *editObject;
@property (nonatomic, strong) NSString *editKey;
@property (nonatomic, strong) NSString *editName;

@end
