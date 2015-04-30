//
//  ViewController.m
//  parseLogin
//
//  Created by Zachary Brown on 30/04/2015.
//  Copyright (c) 2015 Zac. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (nonatomic) BOOL signUp;
@property (nonatomic) BOOL success;
@end

@implementation ViewController
- (BOOL)signUp:(NSString *)username and:(NSString *)password {
        //signup method
    
        _usernameField.text = @"";
        _passwordField.text = @"";
    
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                _signUp = YES;
                _success = YES;
                [self performSegueWithIdentifier:@"nextScreen" sender:nil];

            } else {
                _signUp = NO;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [alert show];

            }
        }];
    if (_signUp) {
        return YES;
    } else {
        return NO;
    }
}
- (void)viewWillAppear:(BOOL)animated {
    _signUp = NO;
    _success = NO;
    _usernameField.delegate = self;
    _passwordField.delegate = self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}
- (IBAction)loginButton:(id)sender {

        //login method
        [PFUser logInWithUsernameInBackground:_usernameField.text password:_passwordField.text block:^(PFUser *user, NSError *error) {
            if (!error) {
                _success = YES;
                _usernameField.text = @"";
                _passwordField.text = @"";
                [self performSegueWithIdentifier:@"nextScreen" sender:nil];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
}
- (void)resetDefaults {
     _success = NO;
    _signUp = NO;
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"signUp"]) {
        [self resetDefaults];
        return YES;
       
    } else {
        if (_success) {
            [self resetDefaults];
            return YES;
        } else {
            return NO;
        }
    }
}
- (IBAction)signUpButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    signUpViewController *vc = [[signUpViewController alloc] init];
    vc = (signUpViewController *)[storyboard instantiateViewControllerWithIdentifier:@"signUp"];
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
