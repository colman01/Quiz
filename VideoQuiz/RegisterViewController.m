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
@synthesize conn;

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
    DmUser *user = [[QuizDao instance] currentUser];
    if (user) {
        self.userName.text = user.username;
        self.password.text = user.password;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) connectionHasFinished:(NSString *)data {
    if ([data isEqualToString:@"done"]) {
        DmUser *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
        user.username = self.userName.text;
        user.password = self.password.text;
        [[QuizDao instance] setCurrentUser:user];
        [[PersistManager instance] save];

        [self.navigationController popViewControllerAnimated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User Already Registered" message:@"Please try again with a different email" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}




- (IBAction)registerButton:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSString *data = [appDelegate getUrl];
    NSString *str = @"account_register_action.php";
    str = [NSString stringWithFormat:@"%@%@", data, str];
    
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[[NSString stringWithFormat:@"username=%@&password=%@&email=%@", userName.text, password.text, email.text] dataUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if (data){
            [self performSelectorOnMainThread:@selector(connectionHasFinished:) withObject:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] waitUntilDone:NO];
        }
        else if (error)
            NSLog(@"%@",error);
    }];
}

#pragma mark - Navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    
//}

@end
