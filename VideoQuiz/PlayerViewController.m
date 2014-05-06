//
//  PlayerViewController.m
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "PlayerViewController.h"
#import <objc/message.h>

@interface PlayerViewController ()

@end

@implementation PlayerViewController
@synthesize videoPlayer;
@synthesize fileNames;
@synthesize fileIndex;
@synthesize thisUser;

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


-(void) viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    //    self.navigationController.navigationBar.hidden = YES;
    
    [self shouldAutorotate];
    
    if(UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
        {
            objc_msgSend([UIDevice currentDevice], @selector(setOrientation:), UIInterfaceOrientationLandscapeLeft );
            
            
        }
    }
}

-(void) viewDidAppear:(BOOL)animated {
//    NSMutableArray * results = [[QuizDao instance] getQuiz];
//    thisUser = results[0];
    if (!thisUser.points) {
        thisUser.points = [NSNumber numberWithInt:1];
    } else {
        int points = [thisUser.points intValue];
        points++;
        thisUser.points = [NSNumber numberWithInt:points];
    }
    [[PersistManager instance] save];
    
    [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:")
                                   withObject:(__bridge id)((void*)UIInterfaceOrientationLandscapeRight)];

    
    [super viewDidAppear:animated];
    int r = arc4random() % 4;
    NSString *name = [fileNames objectAtIndex:self.fileIndex];
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];

    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
            videoPlayer.view.frame = CGRectMake(0, 0,320, 568  );
    } else {
        videoPlayer.view.frame = CGRectMake(0, 0,568, 320  );
    }

    
    videoPlayer.controlStyle = MPMovieControlStyleNone;
    videoPlayer.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth  |    UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight);
    [videoPlayer play];
    [self.view addSubview:videoPlayer.view];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(moviePlayBackDidFinish:)
//                                                 name:MPMoviePlayerPlaybackDidFinishNotification
//                                               object:videoPlayer];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                    style:UIBarButtonItemStyleDone target:self action:@selector(moviePlayBackDidFinish:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    Wait
    [self performSegueWithIdentifier:@"Wait" sender:nil];
}



@end
