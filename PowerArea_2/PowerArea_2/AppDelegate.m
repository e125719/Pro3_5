//
//  AppDelegate.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize manageObjectContext = _manageObjectContext;
@synthesize manageObjectModel = _manageObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSArray *)getAllMap {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MapDataEntity" inManagedObjectContext:self.manageObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    
    NSArray *fetchedRecords = [self.manageObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return fetchedRecords;
}

- (NSManagedObjectContext *)manageObjectContext {
    if (_manageObjectContext != nil) {
        return _manageObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        _manageObjectContext = [[NSManagedObjectContext alloc] init];
        [_manageObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _manageObjectContext;
}

- (NSManagedObjectModel *)manageObjectModel {
    if (_manageObjectModel != nil) {
        return _manageObjectModel;
    }
    
    _manageObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _manageObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeUrl = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"PowerArea_2.sqlite"]];
    
    NSError *error = nil;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configration:nil URL:storeUrl options:nil error:&error]) {
    }
    
    return _persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
