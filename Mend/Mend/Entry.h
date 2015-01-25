//
//  Entry.h
//  Mend
//
//  Created by Rahul Madduluri on 1/25/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Professional.h"

@interface Entry : NSObject

@property (strong, nonatomic) NSString *diagnosisName;
@property (strong, nonatomic) Professional *professional;
@property (strong, nonatomic) NSMutableSet *drugs;
@property (strong, nonatomic) NSMutableSet *symptoms;

@end
