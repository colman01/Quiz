//
//  DownloadViewController.m
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "DownloadViewController.h"

@interface DownloadViewController ()

@end

@implementation DownloadViewController

@synthesize clip1, clip2, clip3, clip4, clip5;
@synthesize clipDownloader1, clipDownloader2,clipDownloader3,clipDownloader4,clipDownloader5;
@synthesize requests;
@synthesize clip1Image, clip2Image, clip3Image, clip4Image, clip5Image;
@synthesize images;

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
    [self createUrls];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



- (IBAction)downloadClip:(id)sender {
    UIButton *btn = (UIButton *) sender;
    [self createConnection:[requests objectAtIndex:btn.tag]];
}


- (void) createConnection:(NSURLRequest *) request {
    clipDownloader1 = [[ClipDownloader alloc] initWithRequest:request delegate:clipDownloader1];
    [clipDownloader1 start];
}


- (void) createUrls {
    if (!requests) {
        requests = [[NSMutableArray alloc] init];
        [requests addObject:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
        [requests addObject:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.rte.ie"]]];
        [requests addObject:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.cnn.com"]]];
        [requests addObject:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.wikipedia.com"]]];
        [requests addObject:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.ie"]]];
    }
}

- (void) createImageArray {
    [images addObject:clip1Image];
    [images addObject:clip2Image];
    [images addObject:clip3Image];
    [images addObject:clip4Image];
    [images addObject:clip5Image];
}



@end
