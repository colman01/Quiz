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
@synthesize thisUser;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewDidAppear:(BOOL)animated  {
    [usernameBadge setText:thisUser.username];
    [usernameBadge sizeToFit];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id dest = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"Download"]) {
        DownloadViewController *downloadVC = (DownloadViewController *) dest;
        [downloadVC setThisUser:thisUser];
        downloadVC.usernameBadgeText = self.usernameBadgeText;
    }
    if ([[segue identifier] isEqualToString:@"Settings"]) {
        SettingsViewController *settingsVC = (SettingsViewController *) dest;
        [settingsVC setThisUser:thisUser];
    }
    if ([[segue identifier] isEqualToString:@"Points"]) {
        PointSummaryViewController *pointSummaryController = (PointSummaryViewController *) dest;
        [pointSummaryController setThisUser:thisUser];
    }
    if ([[segue identifier] isEqualToString:@"CashIn"]) {
        CashInPointsViewController *cashIn = (CashInPointsViewController *) dest;
        [cashIn setThisUser:thisUser];
    }
}

@end
