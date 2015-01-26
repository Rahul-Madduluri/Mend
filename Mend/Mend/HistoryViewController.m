//
//  HistoryViewController.m
//  Mend
//
//  Created by Spencer Congero on 1/25/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "HistoryViewController.h"
#import "EntryViewController.h"

@interface HistoryViewController ()

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _treatments = [[NSDictionary alloc] initWithObjects:@[@"1", @"2", @"3"] forKeys:@[@"A", @"B", @"C"]];
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
    //[self.navigationController pushViewController:myNewVC animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:myNewVC animated:YES completion:nil];
    });
    
    //[self performSegueWithIdentifier: @"MySegue" sender: self];
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Yupppp");
    EntryViewController *vcToPushTo = [segue destinationViewController];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end