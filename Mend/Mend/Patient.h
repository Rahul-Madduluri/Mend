//
//  Patient.h
//  Mend
//
//  Created by Rahul Madduluri on 1/25/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableSet *entries;

@end
