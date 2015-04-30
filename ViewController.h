//
//  ViewController.h
//  parseLogin
//
//  Created by Zachary Brown on 30/04/2015.
//  Copyright (c) 2015 Zac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "signUpViewController.h"
@interface ViewController : UIViewController <UITextFieldDelegate, signUpProtocol>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@end

