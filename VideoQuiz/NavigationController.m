//
//  NavigationController.m
//  VideoQuiz
//
//  Created by colman on 20.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}
*/


- (BOOL) shouldAutorotate {
    UIViewController *vc = self.topViewController;
    if ([vc isKindOfClass:[PlayerViewController class]])
        return YES;
    if ( [vc isKindOfClass:[PrepareQuestionsViewController class]]) {
        if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
            return YES;
        }
        else {
            return NO;
        }
        
        return YES;
    }
    if ([vc isKindOfClass:[DownloadViewController class]]  || [vc isKindOfClass:[MultipleChoiceQuestionsViewController class]] ) {
        
            if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
                return YES;
            }
            else {
                return NO;
            }
        
        return YES;
    }
    return NO;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    UIViewController *vc = self.topViewController;
    if ([vc isKindOfClass:[PlayerViewController class]])
        if (toInterfaceOrientation != UIInterfaceOrientationPortrait) {
            return YES;
        }
    
    if ([vc isKindOfClass:[DownloadViewController class]] || [vc isKindOfClass:[MultipleChoiceQuestionsViewController class]]) {
        if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
                return NO;
        } else {
            return YES;
        }
    } else if ( [vc isKindOfClass:[PrepareQuestionsViewController class]]) {
        if (toInterfaceOrientation != UIInterfaceOrientationPortrait) {
            return NO;
        } else {
            return YES;
        }   
    }
    if (toInterfaceOrientation != UIInterfaceOrientationPortrait) {
        return NO;
    }
    return NO;

}

- (NSUInteger)supportedInterfaceOrientations {
    if ([self.topViewController isMemberOfClass:[DownloadViewController class]] || [self.topViewController isMemberOfClass:[MultipleChoiceQuestionsViewController class]] ){
        return UIInterfaceOrientationMaskPortrait;
    }else if([self.topViewController isMemberOfClass:[PrepareQuestionsViewController class]]){
        return UIInterfaceOrientationMaskLandscapeLeft;
    }else if([self.topViewController isMemberOfClass:[PlayerViewController class]]) {
        return UIInterfaceOrientationMaskLandscapeLeft;
    }else{
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

@end
