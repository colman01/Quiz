//
//  DownloadViewController.h
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClipDownloader.h"
#import "PlayerViewController.h"
#import "Data.h"
#import "AppDelegate.h"


@interface DownloadViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *downloadButtons;
@property (strong, nonatomic) IBOutlet UIButton * clip1;
@property (strong, nonatomic) IBOutlet UIButton * clip2;
@property (strong, nonatomic) IBOutlet UIButton * clip3;
@property (strong, nonatomic) IBOutlet UIButton * clip4;
@property (strong, nonatomic) IBOutlet UIButton * clip5;

@property (strong, nonatomic) IBOutlet UIButton * clip1Image;
@property (strong, nonatomic) IBOutlet UIButton * clip2Image;
@property (strong, nonatomic) IBOutlet UIButton * clip3Image;
@property (strong, nonatomic) IBOutlet UIButton * clip4Image;
@property (strong, nonatomic) IBOutlet UIButton * clip5Image;

@property (strong, nonatomic) ClipDownloader *clipDownloader1;
@property (strong, nonatomic) ClipDownloader *clipDownloader2;
@property (strong, nonatomic) ClipDownloader *clipDownloader3;
@property (strong, nonatomic) ClipDownloader *clipDownloader4;
@property (strong, nonatomic) ClipDownloader *clipDownloader5;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *requests;
@property (strong, nonatomic) NSMutableArray *images;

@property (strong, nonatomic) IBOutlet UILabel *usernameBadge;
@property (strong, nonatomic) NSString *usernameBadgeText;

@property (strong, nonatomic) NSMutableArray *fileNames;
@property int fileIndex;

@property (strong, nonatomic) DmUser *thisUser;


@end
