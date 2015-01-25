//
//  LaunchViewController.m
//  Mend
//
//  Created by Rahul Madduluri on 1/24/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "LaunchViewController.h"
#import "NewEntryViewController.h"

@interface LaunchViewController ()

@property (nonatomic, strong) UIImageView *mendTitle;
@property (nonatomic, strong) UIImageView *mendLogo;
@property (nonatomic, strong) UIImageView *circle1;
@property (nonatomic, strong) UIImageView *circle2;

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
    // mend logo
    UIImage *mendLogo = [UIImage imageNamed:@"bandaid.png"];
    CGRect logoRect = CGRectMake(50, 50, 100, 100);
    self.mendLogo = [[UIImageView alloc] initWithImage:mendLogo];
    [self.mendLogo setFrame:logoRect];
    [self.view addSubview:self.mendLogo];
    // mend title
    UIImage *mendImage = [UIImage imageNamed:@"MendTitle.png"];
    CGRect rect = CGRectMake(150, 50, 200, 100);
    self.mendTitle = [[UIImageView alloc] initWithImage:mendImage];
    [self.mendTitle setFrame:rect];
    [self.view addSubview:self.mendTitle];
    // circle1
    UIImage *circle1 = [UIImage imageNamed:@"circle1.png"];
    CGRect circle1Rect = CGRectMake(100, 200, 200, 200);
    self.circle1 = [[UIImageView alloc] initWithImage:circle1];
    [self.circle1 setFrame:circle1Rect];
    [self.circle1 setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTapCircle1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTappingCircle1:)];
    [singleTapCircle1 setNumberOfTapsRequired:1];
    [self.circle1 addGestureRecognizer:singleTapCircle1];
    [self.view addSubview:self.circle1];
    // circle2
    UIImage *circle2 = [UIImage imageNamed:@"circle2.png"];
    CGRect circle2Rect = CGRectMake(100, 400, 200, 200);
    self.circle2 = [[UIImageView alloc] initWithImage:circle2];
    [self.circle2 setFrame:circle2Rect];
    [self.circle2 setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTapCircle2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTappingCircle2:)];
    [singleTapCircle2 setNumberOfTapsRequired:1];
    [self.circle2 addGestureRecognizer:singleTapCircle2];
    [self.view addSubview:self.circle2];
}

-(void)singleTappingCircle1:(UIGestureRecognizer *)recognizer
{
    NewEntryViewController *myNewVC = [[NewEntryViewController alloc] init];
    [self presentViewController:myNewVC animated:YES completion:nil];
}

-(void)singleTappingCircle2:(UIGestureRecognizer *)recognizer
{
    NSLog(@"circle 2 click");
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
