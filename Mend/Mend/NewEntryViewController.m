//
//  NewEntryViewController.m
//  Mend
//
//  Created by Rahul Madduluri on 1/25/15.
//  Copyright (c) 2015 mend. All rights reserved.
//

#import "NewEntryViewController.h"
#import "LaunchViewController.h"

@interface NewEntryViewController ()

@property (nonatomic, strong) UITextField *smartField;
@property (nonatomic, strong) UITableView *autocompleteTableView;
@property (nonatomic, strong) UIImageView *askAPro;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation NewEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //text field
    CGRect frame = CGRectMake(100, 75, 150, 50);
    self.smartField = [[UITextField alloc] initWithFrame:frame];
    self.smartField.delegate = self;
    self.smartField.font = [UIFont boldSystemFontOfSize:20];
    self.smartField.placeholder = @"symptom";
    self.smartField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:self.smartField];
    
    //table view
    self.autocompleteTableView = [[UITableView alloc] initWithFrame:
                             CGRectMake(0, 125, 320, 120) style:UITableViewStylePlain];
    self.autocompleteTableView.delegate = self;
    self.autocompleteTableView.dataSource = self;
    self.autocompleteTableView.scrollEnabled = YES;
    self.autocompleteTableView.hidden = NO;
    [self.view addSubview:self.autocompleteTableView];
    
    //back button
    CGRect buttonFrame = CGRectMake(15, 30, 35, 35);
    self.backButton = [[UIButton alloc] initWithFrame:buttonFrame];
    UIImage *back = [UIImage imageNamed:@"backarrow(clear).png"];
    [self.backButton setImage:back forState:UIControlStateNormal];
    UITapGestureRecognizer *singleTapBack = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToLaunchScreen:)];
    [singleTapBack setNumberOfTapsRequired:1];
    [self.backButton addGestureRecognizer:singleTapBack];

    [self.view addSubview:self.backButton];
    
    
    //all possible symptoms
    self.allSymptoms = [[NSMutableSet alloc] initWithArray:[NSArray arrayWithObjects:@"nauseau", @"cough", @"rash", @"sore throat", @"wheezing", @"congestion", @"sneezing", @"runny nose", @"dry eyes", @"itchy skin", @"bumps", @"abdominal pain", @"allergy", @"anxiety", @"bad breath", @"blurred vision", @"bloody nose", @"breast lumps", @"chest pain", @"chills", @"cold", @"confusion", @"depression", @"diarrhea", @"fever", @"fatigue", @"flu", @"fainting", @"gas", @"hair loss", @"headache", @"heartburn", @"hot flashes", @"insomnia", @"inattention", @"memory loss", @"mood swings", @"muscle cramps", @"neck pain", @"pale skin", @"pink eye", @"rash", @"runny nose", @"seizures", @"stomach cramps", nil]];
    self.autocompleteSymptoms = [[NSMutableArray alloc] init];
    
    //button to ask professional
    UIImage *ask = [UIImage imageNamed:@"askapro.png"];
    self.askAPro = [[UIImageView alloc] initWithImage:ask];
    self.askAPro.frame = CGRectMake(115, 400, 150, 150);
    [self.view addSubview:self.askAPro];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//sends app back to launch screen when back button is pressed
-(void)backToLaunchScreen:(UIGestureRecognizer *)recognizer
{
    LaunchViewController *myNewVC = [[LaunchViewController alloc] init];
    [self presentViewController:myNewVC animated:YES completion:nil];
}


- (void)loadView {
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
}

//table view delegates
- (UITableViewCell *)tableView:tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"hello");
    static NSString *CellIdentifier = @"entryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        // More initializations if needed.
    }
    cell.textLabel.text = [self.autocompleteSymptoms objectAtIndex:indexPath.row];

    return cell;
}
- (NSInteger)tableView:tableView numberOfRowsInSection:(NSInteger)section {
    return [self.autocompleteSymptoms count];
}


//text field delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.autocompleteTableView.hidden = NO;
    
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:string];
    [self searchAutocompleteEntriesWithSubstring:substring];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    // Put anything that starts with this substring into the autocompleteUrls array
    // The items in this array is what will show up in the table view
    [self.autocompleteSymptoms removeAllObjects];
    for(NSString *curString in self.allSymptoms) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            [self.autocompleteSymptoms addObject:curString];
        }
    }
    [self.autocompleteTableView reloadData];
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
