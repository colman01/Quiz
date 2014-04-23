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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    // Do any additional setup after loading the view.
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0.1];
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
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
    
    //    Wait
//    [self performSegueWithIdentifier:@"Wait" sender:nil];
}
//
//-(BOOL)shouldAutorotate
//{
//    return NO;
//}

//-(BOOL)shouldAutorotate {
////    return [[self.navigationController.viewControllers lastObject] shouldAutorotate];
//    return UIInterfaceOrientationMaskPortrait;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
////    return [[self.navigationController.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
//    return UIInterfaceOrientationPortrait;
//}
//
//
//-(NSUInteger)supportedInterfaceOrientations
//{
//    UIInterfaceOrientationMask orientationMask = UIInterfaceOrientationMaskPortrait;
//    return orientationMask;
//}
//
//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//    if (toInterfaceOrientation == (UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight)) {
//        return YES;
//    }
//    return NO;
//}


- (BOOL)shouldAutorotate  // iOS 6 autorotation fix
{
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations // iOS 6 autorotation fix
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation // iOS 6 autorotation fix
{
    return UIInterfaceOrientationPortrait;
}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//    return YES;
//}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
