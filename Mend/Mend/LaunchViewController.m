//
//  LaunchViewController.m
//  Mend
//
//  Created by Rahul Madduluri on 1/24/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "LaunchViewController.h"
#import "NewEntryViewController.h"
#import "HistoryViewController.h"

@interface LaunchViewController ()

@property (nonatomic, strong) UIImageView *mendTitle;
@property (nonatomic, strong) UIImageView *mendLogo;
@property (nonatomic, strong) UIButton *circle1;
@property (nonatomic, strong) UIButton *circle2;

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
    
    // UI
    //--------------------
    // mend logo
    UIImage *mendLogo = [UIImage imageNamed:@"bandaid.png"];
    CGRect logoRect = CGRectMake(35, 50, 75, 75);
    self.mendLogo = [[UIImageView alloc] initWithImage:mendLogo];
    [self.mendLogo setFrame:logoRect];
    [self.view addSubview:self.mendLogo];
    // mend title
    UIImage *mendImage = [UIImage imageNamed:@"MendTitle.png"];
    CGRect rect = CGRectMake(100, 50, 250, 100);
    self.mendTitle = [[UIImageView alloc] initWithImage:mendImage];
    [self.mendTitle setFrame:rect];
    [self.view addSubview:self.mendTitle];
    // circle1
    UIImage *circle1 = [UIImage imageNamed:@"circle1.png"];
    CGRect circle1Rect = CGRectMake(100, 200, 200, 200);
    self.circle1 = [[UIButton alloc] initWithFrame:circle1Rect];
    [self.circle1 setImage:circle1 forState:UIControlStateNormal];
    UITapGestureRecognizer *singleTapCircle1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTappingCircle1:)];
    [singleTapCircle1 setNumberOfTapsRequired:1];
    [self.circle1 addGestureRecognizer:singleTapCircle1];
    [self.view addSubview:self.circle1];
    // circle2
    UIImage *circle2 = [UIImage imageNamed:@"circle2.png"];
    CGRect circle2Rect = CGRectMake(100, 400, 200, 200);
    self.circle2 = [[UIButton alloc] initWithFrame:circle2Rect];
    [self.circle2 setImage:circle2 forState:UIControlStateNormal];
    UITapGestureRecognizer *singleTapCircle2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTappingCircle2:)];
    [singleTapCircle2 setNumberOfTapsRequired:1];
    [self.circle2 addGestureRecognizer:singleTapCircle2];
    [self.view addSubview:self.circle2];
    //------------------------
}

-(void)singleTappingCircle1:(UIGestureRecognizer *)recognizer
{
    NewEntryViewController *myNewVC = [[NewEntryViewController alloc] init];
    [self presentViewController:myNewVC animated:YES completion:nil];
}

-(void)singleTappingCircle2:(UIGestureRecognizer *)recognizer
{
    HistoryViewController *myNewVC = [[HistoryViewController alloc] init];
    [self presentViewController:myNewVC animated:YES completion:nil];
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
