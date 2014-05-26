//
//  Map.h
//  PowerArea
//
//  Created by Hiroki MATSUMOTO on 5/26/14.
//  Copyright (c) 2014 Hiroki MATSUMOTO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Map : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * comment;

@end
