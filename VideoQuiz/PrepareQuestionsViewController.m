//
//  PrepareQuestionsViewController.m
//  VideoQuiz
//
//  Created by colman on 23.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "PrepareQuestionsViewController.h"

@interface PrepareQuestionsViewController ()

@end

@implementation PrepareQuestionsViewController

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

- (void) viewDidAppear:(BOOL)animated   {
    [super viewDidAppear:animated];
    [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:")
                                   withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeLeft)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotate
{
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //    Wait
//    [self performSegueWithIdentifier:@"Wait" sender:nil];
    
}


@end
