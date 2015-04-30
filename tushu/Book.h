//
//  Book.h
//  tushu
//
//  Created by Faith on 15-4-30.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSNumber * state;
@property (nonatomic, retain) NSString * brief;
@property (nonatomic, retain) NSManagedObject *owner;

@end
