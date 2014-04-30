//
//  AdFeedbackViewController.h
//  VideoQuiz
//
//  Created by colman on 24.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface AdFeedbackViewController : UIViewController

@property (strong, nonatomic) DmUser *thisUser;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end
