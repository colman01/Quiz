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

//- (void) viewWillAppear:(BOOL)animated  {
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    self.navigationController.navigationBar.hidden = YES;
//    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
//}

- (void) viewDidAppear:(BOOL)animated   {
    [super viewDidAppear:animated];
    [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:")
                                   withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeRight)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
////    self.navigationController.navigationBar.hidden = YES;
//    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
    
    //    Wait
//    [self performSegueWithIdentifier:@"Wait" sender:nil];
    
//    id con = segue.destinationViewController;
//    MultipleChoiceQuestionsViewController *multi = (MultipleChoiceQuestionsViewController *) con;
//    [multi shouldAutorotate];
}


@end
