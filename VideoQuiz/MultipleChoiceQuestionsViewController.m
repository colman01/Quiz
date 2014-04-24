//
//  MultipleChoiceQuestionsViewController.m
//  VideoQuiz
//
//  Created by colman on 23.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "MultipleChoiceQuestionsViewController.h"
#import <objc/message.h>

@interface MultipleChoiceQuestionsViewController ()

@end

@implementation MultipleChoiceQuestionsViewController

@synthesize answer1, answer2, answer3, answer4, questionLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated  {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0.1];
    
    [self shouldAutorotate];
    
    if(UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
        {
            objc_msgSend([UIDevice currentDevice], @selector(setOrientation:), UIInterfaceOrientationLandscapeLeft );
            
            
        }
    }
    
}

- (void) viewDidAppear:(BOOL)animated{

    
    [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:")
                                   withObject:(__bridge id)((void*)UIInterfaceOrientationPortrait)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0.1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
    
    //    Wait
//    [self performSegueWithIdentifier:@"Wait" sender:nil];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
