//
//  RegisterViewController.h
//  VideoQuiz
//
//  Created by colman on 23.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "RegisterConnection.h"
#import "DmUser.h"
#import "PersistManager.h"
#import "QuizDao.h"
#import "AppDelegate.h"


@interface RegisterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *passwordConfirm;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *emailConfirm;

@property (strong, nonatomic) RegisterConnection *conn;




@end
