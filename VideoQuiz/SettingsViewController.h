//
//  SettingsViewController.h
//  VideoQuiz
//
//  Created by colman on 20.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface SettingsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *usernameBadge;
@property (strong, nonatomic) NSString *usernameBadgeText;

@property (strong, nonatomic) IBOutlet UISwitch *singleClip;
@property (strong, nonatomic) IBOutlet UISwitch *allClips;

@property (strong, nonatomic) DmUser *thisUser;

@end
