//
//  RatingViewController.h
//  VideoQuiz
//
//  Created by colman on 24.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface RatingViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) DmUser *thisUser;

@end
