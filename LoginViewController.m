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
    
//    results = nil;
//    [[PersistManager instance] save ];
//    exit(0);
    
//    for (int i=0; i< results.count; i++) {
//        DmUser *user = results[i];
//        [[QuizDao instance] remove:user];
//    }
//    
//    [[PersistManager instance] save];
//    exit(0);
    
    @try {
        thisUser = results[0];
    }
    @catch (NSException *exception) {
//        thisUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    }
    userName.text = thisUser.username;
    password.text = thisUser.password;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewWillDisappear:(BOOL)animated {
//    if (![userName.text isEqualToString:userName.text]) {
//        DmUser * user    = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
//        user.username = userName.text;
//        user.password = password.text;
//        [[PersistManager instance] save];
//    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id dest = [segue destinationViewController];
    CockPitViewController *cockpit = (CockPitViewController *) dest;
    if (!cockpit.usernameBadge) {
        cockpit.usernameBadge = [[UILabel alloc] init] ;
    }
    cockpit.thisUser = thisUser;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
//    if (textField.tag == 0) {
//        thisUser.username = textField.text;
//    }
//    if (textField.tag == 1) {
//        thisUser.password= textField.text;
//    }
//    [[PersistManager instance] save];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark Login send request

- (void) doLogin:(NSString *)username andPassword:(NSString *)passWord {
    NSString *str = @"http://192.168.0.105/videoQuiz/account_login_action.php";
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[[NSString stringWithFormat:@"email=%@&password=%@", username, passWord] dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}


#pragma mark Connection finished
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    NSLog(@"got data %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (IBAction)loginActivate:(id)sender{
    [self doLogin:thisUser.username andPassword:thisUser.password];
    NSMutableArray *results = [[QuizDao instance] getQuiz];
    bool found = NO;
    for (int i=0; i<results.count; i++) {
        DmUser *user = results[i];
        if ([userName.text isEqualToString:user.username]) {
            found = YES;
            thisUser = results[i];
            break;
        }
    }
    if (!found) {
        DmUser *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
        user.username = userName.text;
        thisUser = user;
        [[PersistManager instance] save];
        
        [self addVideoFilesForThisUser];
    }
    
    [[QuizDao instance ] setCurrentUser:thisUser]   ;
    
    [self performSegueWithIdentifier:@"Login" sender:nil];
}


-(void) addVideoFilesForThisUser {
    NSMutableArray *fileNames = [[NSMutableArray alloc] init];
    [fileNames addObject:@"guinness.mov"];
    [fileNames addObject:@"ad bud.mov"];
    [fileNames addObject:@"flake.mov"];
    [fileNames addObject:@"milkTray.mov"];
    [fileNames addObject:@"milkTray.mov"];
    
    
//    NSArray *videos_ = [thisUser.video allObjects];
//    NSMutableArray *videos = [[NSMutableArray alloc] initWithArray:videos_];
    
    for (int i=0; i<fileNames.count; i++) {

        
//        [tempMailCompose addAttachmentData:[NSData dataWithContentsOfURL:videoURL] mimeType:@"video/quicktime" fileName:@"defectVideo.MOV"];
        
        
        
        NSURL *videoURL = [[NSURL alloc] initFileURLWithPath:fileNames[i]];
//        NSData *videoData = [NSData dataWithContentsOfURL:videoURL];
        
        
//        NSString *name = [fileNames objectAtIndex:self.fileIndex];
        NSString *urlStr = [[NSBundle mainBundle] pathForResource:fileNames[i] ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:urlStr];
        NSData *videoData = [[NSData alloc] initWithContentsOfURL:url];
        
        
        DmVideo *video = [NSEntityDescription insertNewObjectForEntityForName:@"Video" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
        
        video.data = videoData;
        
        [thisUser addVideoObject:video];
        
        
    }
    
    
    
    

    
//    thisUser.video = [[NSSet alloc] initWithArray:[[NSArray alloc] initWithArray:videos]];
    [[PersistManager instance] save];
}

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger) buttonIndex {
	if (buttonIndex == 0) {
		return;
	}
	NSString *username = ((UITextField *)[alertView textFieldAtIndex:0]).text;
	NSString *password_ = ((UITextField *)[alertView textFieldAtIndex:1]).text;
    
    thisUser.username = username;
    thisUser.password = password_;
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:username forKey:IWUsernameKey];
	
	KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:IWPasswordIdentifier accessGroup:nil];
	[keychain setObject:thisUser.password forKey:(__bridge id)kSecValueData];

	[_service performSelector:_selector];
}


@end


//-(void) getData {
//    ASIFormDataRequest * r = [ASIFormDataRequest requestWithURL:url];
//    [r addPostValue:@"" forKey:@""];
//    [r addPostValue:@"1234" forKey:@"password"];
//    [r setCompletionBlock:^{
//        NSLog(@"%@", r.responseString);
//    }];
//    [r setFailedBlock:^{
//        NSLog(@"%@", r.error);
//    }];
//    [r startAsynchronous];
//}