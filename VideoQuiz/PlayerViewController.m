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
    if (self) {    }
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
    
    NSArray * videos = [thisUser.video allObjects];
    DmVideo *video = [videos objectAtIndex:self.fileIndex];
    NSString *dataString = [[NSString alloc] initWithData:video.data encoding:NSUTF16StringEncoding];
    NSURL *movieURL = [NSURL URLWithString:dataString];
    videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    
    NSString* completeFileName = [NSString stringWithFormat:@"%@",@"movie.mp4"];
    NSString* filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:completeFileName];
    [[NSFileManager defaultManager] createFileAtPath:filename contents:video.data attributes:nil];
    
    NSURL *baseURL = [NSURL fileURLWithPath:filename isDirectory:NO];
    videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:baseURL];
    
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
            videoPlayer.view.frame = CGRectMake(0, 0,320, 568  );
    } else {
        videoPlayer.view.frame = CGRectMake(0, 0,568, 320  );
    }

    
    videoPlayer.controlStyle = MPMovieControlStyleNone;
    videoPlayer.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth  |    UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight);
    [videoPlayer play];
    [self.view addSubview:videoPlayer.view];

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
