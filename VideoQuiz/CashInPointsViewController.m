//
//  CashInPointsViewController.m
//  VideoQuiz
//
//  Created by colman on 24.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "CashInPointsViewController.h"

@interface CashInPointsViewController ()

@end

@implementation CashInPointsViewController

@synthesize currentPoints;
@synthesize totalPoints;
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
    totalPoints.text = [thisUser.points stringValue];
    currentPoints.text = [thisUser.points stringValue];
    
}

- (void) viewDidAppear:(BOOL)animated  {
    totalPoints.text = [thisUser.points stringValue];
    currentPoints.text = [thisUser.points stringValue];
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
