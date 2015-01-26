//
//  NewEntryViewController.h
//  Mend
//
//  Created by Rahul Madduluri on 1/25/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewEntryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableSet *allSymptoms;
@property (nonatomic, strong) NSMutableArray *autocompleteSymptoms;

@end
