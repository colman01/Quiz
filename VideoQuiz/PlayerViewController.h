//
//  PlayerViewController.h
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPMoviePlayerController.h>
#import "Data.h"
#import "QuizDao.h"

@interface PlayerViewController : UIViewController 

@property (strong, nonatomic) MPMoviePlayerController *videoPlayer;
@property (strong, nonatomic) NSMutableArray *fileNames;
@property int fileIndex;

@property (strong, nonatomic) DmUser *thisUser;





@end
