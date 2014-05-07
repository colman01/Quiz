//
//  RegisterViewController.m
//  VideoQuiz
//
//  Created by colman on 23.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize userName;
@synthesize password;
@synthesize passwordConfirm;
@synthesize email;
@synthesize emailConfirm;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *str = @"http://192.168.0.105/videoQuiz/account_login_action.php";
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[[NSString stringWithFormat:@"username=%@&password=%@&email=%@", userName.text, password.text, email.text] dataUsingEncoding:NSUTF8StringEncoding]];
//    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//    [conn start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)registerButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int i = 0; i < [viewControllers count]; i++){
        id obj = [viewControllers objectAtIndex:i];
        if ([obj isKindOfClass:[ViewController class]]){
            [[self navigationController] popToViewController:obj animated:YES];
            return;
        }
    }
}

#pragma mark - Navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    
//}

@end
