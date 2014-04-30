//
//  CockPitViewController.h
//  VideoQuiz
//
//  Created by colman on 20.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadViewController.h"
#import "SettingsViewController.h"
#import "PointSummaryViewController.h"
#import "CashInPointsViewController.h"
#import "Data.h"

@interface CockPitViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *usernameBadge;
@property (strong, nonatomic) NSString *usernameBadgeText;
@property (strong, nonatomic) DmUser *thisUser;

@end
