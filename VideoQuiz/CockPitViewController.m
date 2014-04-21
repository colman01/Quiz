//
//  CockPitViewController.m
//  VideoQuiz
//
//  Created by colman on 20.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "CockPitViewController.h"

@interface CockPitViewController ()

@end

@implementation CockPitViewController
@synthesize usernameBadge;
@synthesize usernameBadgeText;

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

- (void) viewDidAppear:(BOOL)animated  {
    [usernameBadge setText:usernameBadgeText];
    [usernameBadge sizeToFit];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    id dest = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"Download"]) {
        DownloadViewController *downloadVC = (DownloadViewController *) dest;
        [downloadVC.usernameBadge setText:usernameBadge.text];
        
//        [cockpit.usernameBadge setText:user];
        downloadVC.usernameBadgeText = self.usernameBadgeText;
    }
    
    if ([[segue identifier] isEqualToString:@"Settings"]) {
        SettingsViewController *settingsVC = (SettingsViewController *) dest;
//        [settingsVC.usernameBadge setText:usernameBadge.text];
        settingsVC.usernameBadgeText = self.usernameBadgeText;
    }
    

}

@end