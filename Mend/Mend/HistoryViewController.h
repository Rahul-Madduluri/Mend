//
//  HistoryViewController.h
//  Mend
//
//  Created by Spencer Congero on 1/25/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSOrderedSet *treatments;

@end
