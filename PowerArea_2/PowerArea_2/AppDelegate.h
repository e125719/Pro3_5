//
//  AppDelegate.h
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, readonly) NSManagedObjectContext *manageObjectContext;
@property (strong, nonatomic, readonly) NSManagedObjectModel *manageObjectModel;
@property (strong, nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic, readonly) NSNumber *datacount;

- (NSArray *)getAllMap;

@end
