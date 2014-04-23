//
//  PlayerViewController.m
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController
@synthesize videoPlayer;
@synthesize fileNames;

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
    fileNames = [[NSMutableArray alloc] init];
    [fileNames addObject:@"guinness.mov"];
    [fileNames addObject:@"ad bud.mov"];
    [fileNames addObject:@"flake.mov"];
    [fileNames addObject:@"milkTray.mov"];
    [fileNames addObject:@"milkTray.mov"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    int r = arc4random() % 4;
    NSString *name = [fileNames objectAtIndex:r];
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];

    videoPlayer.view.frame = CGRectMake(0, -20,320, 568  );
    videoPlayer.controlStyle = MPMovieControlStyleNone;
    videoPlayer.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth  |    UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight);
    [videoPlayer play];
    [self.view addSubview:videoPlayer.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:videoPlayer];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    Wait
    [self performSegueWithIdentifier:@"Wait" sender:nil];
//    [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:")
//                                   withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeRight)];
    
}

- (BOOL)shouldAutorotate  // iOS 6 autorotation fix
{
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations // iOS 6 autorotation fix
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation // iOS 6 autorotation fix
{
    return UIInterfaceOrientationLandscapeRight;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
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


@end
