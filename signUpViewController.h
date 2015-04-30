//
//  signUpViewController.h
//  parseLogin
//
//  Created by Zachary Brown on 30/04/2015.
//  Copyright (c) 2015 Zac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol signUpProtocol <NSObject>

- (BOOL)signUp:(NSString *)username and:(NSString *)password;

@end

@interface signUpViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, weak) id<signUpProtocol> delegate;
@end
