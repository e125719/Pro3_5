//
//  MapEntity.h
//  PowerSpot
//
//  Created by e125719 on 2014/05/18.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MapEntity : NSManagedObject

@property (nonatomic, retain) NSNumber *coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *comment;
@property (nonatomic, retain) NSNumber *status;

@end
