//
//  FunFactViewController.m
//  VideoQuiz
//
//  Created by colman on 24.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "FunFactViewController.h"

@interface FunFactViewController ()

@end

@implementation FunFactViewController

@synthesize textLabel;
@synthesize answer1;
@synthesize answer2;
@synthesize answer3;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}


- (IBAction)returnToCockpit:(id)sender {
    [self performSegueWithIdentifier:@"Return" sender:nil];
}

@end
