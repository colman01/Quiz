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



//SEL _selector;
//id _service;
//
//- (id) initWithSelector:(SEL)aSelector onService:(id) service {
//	self = [super init];
//    if (self) {
//        // Initialization code
//		_selector = aSelector;
//		_service = service;
//    }
//    return self;
//}
//
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//- (void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger) buttonIndex {
//	if (buttonIndex == 0) {
//		return;
//	}
//	NSString *username = ((UITextField *)[alertView textFieldAtIndex:0]).text;
//	NSString *password = ((UITextField *)[alertView textFieldAtIndex:1]).text;
//	
//	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//	[defaults setObject:username forKey:IWUsernameKey];
//	
//	KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:IWPasswordIdentifier accessGroup:nil];
//	[keychain setObject:password forKey:(__bridge id)kSecValueData];
//	
//	[_service performSelector:_selector];
//}

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
