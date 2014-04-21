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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (BOOL) shouldAutorotate {
    UIViewController *vc = self.topViewController;
    if ([vc isKindOfClass:[PlayerViewController class]])
        return YES;
    if ([vc isKindOfClass:[DownloadViewController class]]) {
        
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
        return YES;
    
    if ([vc isKindOfClass:[DownloadViewController class]]) {
        if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
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
    if ([self.topViewController isMemberOfClass:[DownloadViewController class]]){
        return UIInterfaceOrientationMaskPortrait;
    }else{
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

@end
