//
//  GoodTableViewController.h
//  PowerSpot
//
//  Created by Hiroki MATSUMOTO on 5/25/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

@class MapEntity;

@interface GoodTableViewController : UITableViewController

@property (nonatomic, strong) MapEntity *mapentity;

@end

@interface GoodTableViewController (private)

- (void)setUpUndoManager;
- (void)cleanUpUndoManager;

@end
