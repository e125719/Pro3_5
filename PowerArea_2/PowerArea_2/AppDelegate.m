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

- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request error:(NSError **)error{
    // 検索リクエストのオブジェクトを生成します。
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // 対象エンティティを指定します。
    NSEntityDescription *entity
    = [NSEntityDescription entityForName:@"IdEntity" inManagedObjectContext:self.manageObjectContext];
    [fetchRequest setEntity:entity];
    
    // キャッシュサイズや上限を指定します。
    [fetchRequest setFetchBatchSize:20];
    [fetchRequest setFetchLimit:0];
    
    // 検索条件を指定します。
    NSPredicate *pred
    = [NSPredicate predicateWithFormat:@"isError = 0"];
    [fetchRequest setPredicate:pred];
    
    // ソート条件を指定します。
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"user" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    // 上記リクエストを元に件数を取得します。
    NSError *erro = nil;
    int count = [self.manageObjectContext countForFetchRequest:fetchRequest error:&erro];
    
    // エラーがあった場合には、エラー情報を表示する。
    if (error) {
        NSLog(@"error occurred. error = %@", erro);
    }
    return count;
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
    
    NSURL *storeUrl = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"MapDataEntity.sqlite"]];
    
    NSError *error = nil;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self manageObjectModel]];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
    }
    
    return _persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
