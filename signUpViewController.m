//
//  signUpViewController.m
//  parseLogin
//
//  Created by Zachary Brown on 30/04/2015.
//  Copyright (c) 2015 Zac. All rights reserved.
//

#import "signUpViewController.h"

@interface signUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (nonatomic) BOOL success;
@end

@implementation signUpViewController
- (IBAction)signUp:(id)sender {
    [self.delegate signUp:_usernameField.text and:_passwordField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _success = NO;
    _usernameField.delegate = self;
    _passwordField.delegate = self;
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
