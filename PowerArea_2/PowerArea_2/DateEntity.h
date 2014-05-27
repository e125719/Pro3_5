//
//  DateEntity.h
//  PowerArea_2
//
//  Created by e125719 on 2014/05/26.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DateEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * coordinate;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * attrs;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSNumber * userid;

@end
