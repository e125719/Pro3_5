//
//  IdEntity.h
//  PowerArea_2
//
//  Created by Hiroki MATSUMOTO on 5/31/14.
//  Copyright (c) 2014 e125719. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface IdEntity : NSManagedObject

@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) NSString * pass;

@end
