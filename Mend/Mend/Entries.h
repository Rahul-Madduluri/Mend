//
//  Entries.h
//  Mend
//
//  Created by Rahul Madduluri on 1/31/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entries : NSObject

@property (nonatomic, strong) NSMutableSet *allEntries;


+(instancetype)sharedInstance;

@end
