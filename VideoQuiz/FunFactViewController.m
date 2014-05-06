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
    if ([[segue identifier] isEqualToString:@"Return"]) {
        
//        NSMutableArray *controllers = self.navigationController.viewControllers;
//        [controllers removeObjectAtIndex:[controllers count] - 1]; //or whatever
//        [self.navigationController setViewControllers:controllers animated:YES];
        
//        NSArray *viewControllers = [[self navigationController] viewControllers];
//        for (int i = 0; i < [viewControllers count]; i++){
//            id obj = [viewControllers objectAtIndex:i];
//            if ([obj isKindOfClass:[CockPitViewController class]]){
//                [[self navigationController] popToViewController:obj animated:YES];
//                return;
//            }
//        }

    }
}


- (IBAction)returnToCockpit:(id)sender {

    NSArray *viewControllers = [[self navigationController] viewControllers];
    for (int i = 0; i < [viewControllers count]; i++){
        id obj = [viewControllers objectAtIndex:i];
        if ([obj isKindOfClass:[CockPitViewController class]]){
            [[self navigationController] popToViewController:obj animated:YES];
            return;
        }
    }

    
//    [self performSegueWithIdentifier:@"Return" sender:nil];
}

@end
