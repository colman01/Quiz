//
//  LoginViewController.m
//  VideoQuiz
//
//  Created by colman on 20.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize userName, password;
@synthesize user, pass;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    id dest = [segue destinationViewController];
    CockPitViewController *cockpit = (CockPitViewController *) dest;
    if (!cockpit.usernameBadge) {
        cockpit.usernameBadge = [[UILabel alloc] init] ;
    }
    [cockpit.usernameBadge setText:user];
    cockpit.usernameBadgeText = user;
}



-(void) textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 0) {
        user = textField.text;
        
    }
    if (textField.tag == 1) {
        pass = textField.text;
    }
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void) doLogin:(NSString *)username andPassword:(NSString *)passWord {
    
}


- (IBAction)loginActivate:(id)sender{
    [self doLogin:user andPassword:pass];
    [self performSegueWithIdentifier:@"Login" sender:nil];
}



@end
