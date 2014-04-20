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

-(void) viewDidAppear:(BOOL)animated {
    
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"flake.mov" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    ////
    videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    videoPlayer.view.frame = CGRectMake(0, 0,568, 320  );
    videoPlayer.view.frame = CGRectMake(0, -20,320, 568  );
    

//    videoPlayer.view.frame = self.view.frame;
    [videoPlayer setFullscreen:YES];
    videoPlayer.controlStyle = MPMovieControlStyleFullscreen;
    videoPlayer.repeatMode = MPMovieRepeatModeOne;
    videoPlayer.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth  |    UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight);
    [videoPlayer play];
    [self.view addSubview:videoPlayer.view];
//    sub = vide    oPlayer.view;
    
}

- (BOOL)shouldAutorotate
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
