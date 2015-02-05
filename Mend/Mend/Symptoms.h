//
//  Symptoms.h
//  Mend
//
//  Created by Rahul Madduluri on 1/30/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import <Foundation/Foundation.h>

//singleton classes that stores all symptoms

@interface Symptoms : NSObject

@property (nonatomic, strong) NSMutableSet *allSymptoms;

+(instancetype)sharedInstance;

@end
