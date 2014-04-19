//
//  DownloadViewController.h
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClipDownloader.h"

@interface DownloadViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton * clip1;
@property (strong, nonatomic) IBOutlet UIButton * clip2;
@property (strong, nonatomic) IBOutlet UIButton * clip3;
@property (strong, nonatomic) IBOutlet UIButton * clip4;
@property (strong, nonatomic) IBOutlet UIButton * clip5;

@property (strong, nonatomic) ClipDownloader *clipDownloader1;
@property (strong, nonatomic) ClipDownloader *clipDownloader2;
@property (strong, nonatomic) ClipDownloader *clipDownloader3;
@property (strong, nonatomic) ClipDownloader *clipDownloader4;
@property (strong, nonatomic) ClipDownloader *clipDownloader5;


@property (strong, nonatomic) NSMutableArray *requests;


@end
