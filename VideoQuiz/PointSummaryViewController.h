//
//  PointSummaryViewController.h
//  VideoQuiz
//
//  Created by colman on 24.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"
#import "QuizDao.h"

@interface PointSummaryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *totalPoints;
@property (strong, nonatomic) DmUser *thisUser;

@end
