//
//  LaunchViewController.m
//  Mend
//
//  Created by Rahul Madduluri on 1/24/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@property (nonatomic, strong) UIImageView *mendTitle;

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    UIImage *mendImage = [UIImage imageNamed:@"MendTitle.png"];
    CGRect rect = CGRectMake(150, 50, 200, 100);
    self.mendTitle = [[UIImageView alloc] initWithImage:mendImage];
    [self.mendTitle setFrame:rect];
    [self.view addSubview:self.mendTitle];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
