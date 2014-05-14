//
//  AdFeedbackViewController.m
//  VideoQuiz
//
//  Created by colman on 24.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "AdFeedbackViewController.h"

@interface AdFeedbackViewController ()

@end

@implementation AdFeedbackViewController

@synthesize textLabel;
@synthesize textView;
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

- (void) viewDidAppear:(BOOL)animated  {
    thisUser = [[QuizDao instance] currentUser];
//    thisUser.feedbackQuestion
    [textLabel setText:thisUser.feedbackQuestion.question];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}


@end
