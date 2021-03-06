//
//  LoginViewController.h
//  VideoQuiz
//
//  Created by colman on 20.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CockPitViewController.h"
#import <Foundation/Foundation.h>
#import "DmUser.h"
#import "QuizDao.h"
#import "AppDelegate.h"

FOUNDATION_EXPORT NSString *const IWUsernameKey;
FOUNDATION_EXPORT NSString *const IWPasswordIdentifier;

@interface LoginViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) DmUser *thisUser;



@end
