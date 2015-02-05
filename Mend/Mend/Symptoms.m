//
//  Symptoms.m
//  Mend
//
//  Created by Rahul Madduluri on 1/30/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "Symptoms.h"

@implementation Symptoms

+(instancetype)sharedInstance
{
    static dispatch_once_t pred;
    static id sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}


-(NSMutableSet *)allSymptoms {
    if (!_allSymptoms) {
        _allSymptoms = [[NSMutableSet alloc] initWithArray:[NSArray arrayWithObjects:@"nauseau", @"cough", @"rash", @"sore throat", @"wheezing", @"congestion", @"sneezing", @"runny nose", @"dry eyes", @"itchy skin", @"bumps", @"abdominal pain", @"allergy", @"anxiety", @"bad breath", @"blurred vision", @"bloody nose", @"breast lumps", @"chest pain", @"chills", @"cold", @"confusion", @"depression", @"diarrhea", @"fever", @"fatigue", @"flu", @"fainting", @"gas", @"hair loss", @"headache", @"heartburn", @"hot flashes", @"insomnia", @"inattention", @"memory loss", @"mood swings", @"muscle cramps", @"neck pain", @"pale skin", @"pink eye", @"rash", @"runny nose", @"seizures", @"stomach cramps", nil]];
    }
    return _allSymptoms;
}

@end
