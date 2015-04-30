//
//  User.m
//  tushu
//
//  Created by Faith on 15-4-30.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import "User.h"
#import "Book.h"


@implementation User

@dynamic name;
@dynamic number;
@dynamic passW;
@dynamic books;
- (void)addBooksObject:(Book *)value
{
    NSMutableOrderedSet *books = [self.books mutableCopy];

    [books addObject:value];
    self.books = books;
}
@end
