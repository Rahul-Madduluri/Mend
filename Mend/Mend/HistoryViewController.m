//
//  HistoryViewController.m
//  Mend
//
//  Created by Spencer Congero on 1/25/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "HistoryViewController.h"
#import "EntryViewController.h"
#import "LaunchViewController.h"

@interface HistoryViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *backButton;


@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //initialize treatments
    self.treatments = [[NSOrderedSet alloc] initWithObjects:@[@"1", @"2", @"3"], nil];
    
    //back button
    CGRect buttonFrame = CGRectMake(15, 30, 35, 35);
    self.backButton = [[UIButton alloc] initWithFrame:buttonFrame];
    UIImage *back = [UIImage imageNamed:@"backarrow(clear).png"];
    [self.backButton setImage:back forState:UIControlStateNormal];
    UITapGestureRecognizer *singleTapBack = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToLaunchScreen:)];
    [singleTapBack setNumberOfTapsRequired:1];
    [self.backButton addGestureRecognizer:singleTapBack];
    [self.view addSubview:self.backButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    
    // history table
    CGRect tableRect = CGRectMake(0, 100, 400, 400);
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableRect style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    
    [self.view addSubview:tableView];
}

//table view delegate
//--------------------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"TreatmentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    return cell;
}

// segue
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EntryViewController *myNewVC = [[EntryViewController alloc] init];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:myNewVC animated:YES completion:nil];
    });
    
}
//--------------------------------------------------------------------------------------------

//sends app back to launch screen when back button is pressed
-(void)backToLaunchScreen:(UIGestureRecognizer *)recognizer
{
    LaunchViewController *myNewVC = [[LaunchViewController alloc] init];
    [self presentViewController:myNewVC animated:YES completion:nil];
}




@end
