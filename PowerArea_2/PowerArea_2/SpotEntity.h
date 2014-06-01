//
//  SpotEntity.h
//  PowerArea_2
//
//  Created by e125719 on 2014/06/01.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SpotEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * spotAttrs;

@end
