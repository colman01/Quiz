//
//  PlayerViewController.h
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPMoviePlayerController.h>

@interface PlayerViewController : UIViewController <MPMediaPlayback>

@property (strong, nonatomic) MPMoviePlayerController *videoPlayer;





@end
