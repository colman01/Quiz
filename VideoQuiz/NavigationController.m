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
//    id currentCon = [self presentedViewController];
    id currentCon =self.childViewControllers[0];
    
    UIViewController *vc = (UIViewController *) currentCon;
    NSNumber *number = [[NSNumber alloc] initWithInteger:[vc.view subviews].count ];
    
    NSLog(@"%@", [number stringValue]);
    for (UIView *view in [vc.view subviews]) {
        if ([view isKindOfClass:[PlayerViewController class]] ) {
            return YES;
        }
    }
    
    
    if ([vc isKindOfClass:[PlayerViewController class]] ) {
        return YES;
    }
    return NO;
}

@end
