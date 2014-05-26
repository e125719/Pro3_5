//
//  AppDelegate.h
//  PowerArea
//
//  Created by Hiroki MATSUMOTO on 5/26/14.
//  Copyright (c) 2014 Hiroki MATSUMOTO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(NSArray*)getAllMap;

@end
