//
//  LoginViewController.m
//  VideoQuiz
//
//  Created by colman on 20.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "LoginViewController.h"
#import "KeychainItemWrapper.h"


NSString *const IWUsernameKey = @"username";
//NSString *const IWPasswordIdentifier = @"SUBITO-01-Immo-Inspect";
NSString *const IWPasswordIdentifier = @"VideoQuiz";



SEL _selector;
id _service;

@interface LoginViewController ()

@end

@implementation LoginViewController


@synthesize userName, password, thisUser;

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
    NSMutableArray *results = [[QuizDao instance] getQuiz];
    @try {
        thisUser = results[0];
    }
    @catch (NSException *exception) {
        thisUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    }
    userName.text = thisUser.username;
    password.text = thisUser.password;
    
//    for (DmUser *user in results) {
//        NSLog(@"data %@", user.username);
//    }
    
//    [[QuizDao instance] remove:results[0] ];
//    [[QuizDao instance] remove:results[1] ];
//    [[QuizDao instance] remove:results[2] ];
//    [[PersistManager instance] save];
//    exit(0);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewWillDisappear:(BOOL)animated {

    if (![userName.text isEqualToString:userName.text]) {
//        DmUser *user = [[QuizDao instance] loadById:[NSNumber numberWithInt:10]];
        DmUser * user    = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
        user.username = userName.text;
        user.password = password.text;
        [[PersistManager instance] save];
    }

}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id dest = [segue destinationViewController];
    CockPitViewController *cockpit = (CockPitViewController *) dest;
    if (!cockpit.usernameBadge) {
        cockpit.usernameBadge = [[UILabel alloc] init] ;
    }
    [cockpit.usernameBadge setText:thisUser.username];
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 0) {
        thisUser.username = textField.text;
        
    }
    if (textField.tag == 1) {
        thisUser.password= textField.text;
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void) doLogin:(NSString *)username andPassword:(NSString *)passWord {
    
}

- (IBAction)loginActivate:(id)sender{
    [self doLogin:thisUser.username andPassword:thisUser.password];
    [self performSegueWithIdentifier:@"Login" sender:nil];
}

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger) buttonIndex {
	if (buttonIndex == 0) {
		return;
	}
	NSString *username = ((UITextField *)[alertView textFieldAtIndex:0]).text;
	NSString *password = ((UITextField *)[alertView textFieldAtIndex:1]).text;
    
    thisUser.username = username;
    thisUser.password = password;
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:username forKey:IWUsernameKey];
	
	KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:IWPasswordIdentifier accessGroup:nil];
	[keychain setObject:thisUser.password forKey:(__bridge id)kSecValueData];

	[_service performSelector:_selector];
}


@end
