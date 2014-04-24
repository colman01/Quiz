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
@synthesize usernameBadge;
@synthesize usernameBadgeText;
@synthesize fileIndex;
@synthesize fileNames;
@synthesize downloadButtons;

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
    [self createImageArray];
    fileNames = [[NSMutableArray alloc] init];
    [fileNames addObject:@"guinness.mov"];
    [fileNames addObject:@"ad bud.mov"];
    [fileNames addObject:@"flake.mov"];
    [fileNames addObject:@"milkTray.mov"];
    [fileNames addObject:@"milkTray.mov"];
    
    
    [clip1 setTitle:@"guiness" forState:UIControlStateNormal];
    
    downloadButtons = [[NSMutableArray alloc] init];
    [downloadButtons addObject:clip1];
    [downloadButtons addObject:clip2];
    [downloadButtons addObject:clip3];
    [downloadButtons addObject:clip4];
    [downloadButtons addObject:clip5];
    
    [self setDownloadButtonTitles];
    
    [clip1 setTitle:@"asdf asdf asdf asdf asdf as asdf" forState:UIControlStateNormal   ];
    

}

- (void) setDownloadButtonTitles {
    for (int i=0; i < self.downloadButtons.count; i++)
        [[downloadButtons objectAtIndex:i] setTitle:[fileNames objectAtIndex:i] forState:UIControlStateNormal];
}

- (void) viewDidAppear:(BOOL)animated  {
    [usernameBadge setText:usernameBadgeText];
    [usernameBadge sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id con = segue.destinationViewController;
    PlayerViewController *player = (PlayerViewController *) con;
    player.fileIndex = self.fileIndex;
    player.fileNames = [[NSMutableArray alloc] init];
    player.fileNames = fileNames;
}


- (IBAction)downloadClip:(id)sender {
    [self someMethod:sender];
    [self someMethod:sender];
}

- (void) someMethod:(id)sender {
    UIButton *btn = (UIButton *) sender;
    //    [self createConnection:[requests objectAtIndex:btn.tag]];
    NSURLRequest *request = [requests objectAtIndex:btn.tag];
    UIButton *imgBtn = [images objectAtIndex:btn.tag];
    
    //    UIImage *img = [UIImage imageNamed:@"clipready.png"];
    //    imgBtn.imageView.image = img;
    
    
    
    switch (btn.tag) {
        case 0:
            clipDownloader1 = [[ClipDownloader alloc] initWithRequest:request delegate:clipDownloader1];
            clipDownloader1.button = [[UIButton alloc] init];
            clipDownloader1.button = imgBtn;
            [clipDownloader1 start];
            
            break;
        case 1:
            clipDownloader2 = [[ClipDownloader alloc] initWithRequest:request delegate:clipDownloader2];
            clipDownloader2.button = [[UIButton alloc] init];
            clipDownloader2.button = imgBtn;
            [clipDownloader2 start];
            break;
        case 2:
            clipDownloader3 = [[ClipDownloader alloc] initWithRequest:request delegate:clipDownloader3];
            
            clipDownloader3.button = [[UIButton alloc] init];
            clipDownloader3.button = imgBtn;
            [clipDownloader3 start];
            break;
        case 3:
            clipDownloader4 = [[ClipDownloader alloc] initWithRequest:request delegate:clipDownloader4];
            
            clipDownloader4.button = [[UIButton alloc] init];
            clipDownloader4.button = imgBtn;
            [clipDownloader4 start];
            break;
        case 4:
            clipDownloader5 = [[ClipDownloader alloc] initWithRequest:request delegate:clipDownloader5];
            clipDownloader5.button = [[UIButton alloc] init];
            clipDownloader5.button = imgBtn;
            [clipDownloader5 start];
            break;
            
        default:
            break;
    }
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
    images = [[NSMutableArray alloc] init];
    [images addObject:clip1Image];
    [images addObject:clip2Image];
    [images addObject:clip3Image];
    [images addObject:clip4Image];
    [images addObject:clip5Image];
}


- (IBAction)showVideo:(id)sender {
    UIButton *btn = (UIButton *) sender;
    self.fileIndex = btn.tag;
    [self performSegueWithIdentifier:@"player" sender:nil];
}



-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    UIInterfaceOrientationMask orientationMask = UIInterfaceOrientationMaskPortrait;
    return orientationMask;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (toInterfaceOrientation == (UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight)) {
        return NO;
    }
    return YES;
}


@end
