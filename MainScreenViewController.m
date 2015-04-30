//
//  MainScreenViewController.m
//  parseLogin
//
//  Created by Zachary Brown on 30/04/2015.
//  Copyright (c) 2015 Zac. All rights reserved.
//

#import "MainScreenViewController.h"
#import <Parse/Parse.h>
@interface MainScreenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end

@implementation MainScreenViewController
- (IBAction)signoutButton:(id)sender {
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewWillAppear:(BOOL)animated {
    PFUser *currentUser = [PFUser currentUser];
    NSString *username = currentUser.username;
    _mainLabel.text = [NSString stringWithFormat:@"Welcome to the app %@", username];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
