//
//  MapDataEntity.h
//  PowerArea_2
//
//  Created by e125719 on 2014/05/27.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MapDataEntity : NSManagedObject

@property (nonatomic, retain) NSString * userid;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * descriptions;

@end
