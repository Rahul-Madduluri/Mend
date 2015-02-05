//
//  Entries.m
//  Mend
//
//  Created by Rahul Madduluri on 1/31/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "Entries.h"

@implementation Entries

+(instancetype)sharedInstance
{
    static dispatch_once_t pred;
    static id sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}


@end
