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
@synthesize thisUser;
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.view.tag == 1) {
        if(!tableView) {
            tableView = [[UITableView alloc] init];
            
        }
        tableView.delegate = self;
    }
    
    fileNames = [[NSMutableArray alloc] init];
    [fileNames addObject:@"guinness.mov"];
    [fileNames addObject:@"ad bud.mov"];
    [fileNames addObject:@"flake.mov"];
    [fileNames addObject:@"milkTray.mov"];
    [fileNames addObject:@"milkTray.mov"];
    [fileNames addObject:@"milkTray.mov"];

    if (self.view.tag == 0) {
    [self createUrls];
    [self createImageArray];

    
    [clip1 setTitle:@"guinness" forState:UIControlStateNormal];
    
    downloadButtons = [[NSMutableArray alloc] init];
    [downloadButtons addObject:clip1];
    [downloadButtons addObject:clip2];
    [downloadButtons addObject:clip3];
    [downloadButtons addObject:clip4];
    [downloadButtons addObject:clip5];
    
    [self setDownloadButtonTitles];

    }
    

}

- (void) setDownloadButtonTitles {
    for (int i=0; i < self.downloadButtons.count; i++)
        [[downloadButtons objectAtIndex:i] setTitle:[fileNames objectAtIndex:i] forState:UIControlStateNormal];
}

- (void) viewDidAppear:(BOOL)animated  {
    [usernameBadge setText:thisUser.username];
    [usernameBadge sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id con = segue.destinationViewController;
    PlayerViewController *player = (PlayerViewController *) con;
    player.fileIndex = self.fileIndex;
    player.fileNames = [[NSMutableArray alloc] init];
    player.fileNames = fileNames;
    
    if ([[segue identifier] isEqualToString:@"player"]) {
        PlayerViewController *playerVC = (PlayerViewController *) con;
        [playerVC setThisUser:thisUser];
    }
}


- (IBAction)downloadClip:(id)sender {
    [self someMethod:sender];
    [self someMethod:sender];
}

- (void) someMethod:(id)sender {
    UIButton *btn = (UIButton *) sender;
    NSURLRequest *request = [requests objectAtIndex:btn.tag];
    UIButton *imgBtn = [images objectAtIndex:btn.tag];
    switch (btn.tag) {
        case 0:{
            clipDownloader1 = [[ClipDownloader alloc] initWithRequest:request delegate:clipDownloader1];
            clipDownloader1.button = [[UIButton alloc] init];
            clipDownloader1.button = imgBtn;
            
            [clipDownloader1 onComplete:^(NSMutableData *value) {
                
                NSData *videoData = [[NSData alloc] initWithData:value];
                DmVideo *video = [NSEntityDescription insertNewObjectForEntityForName:@"Video" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
                [thisUser addVideoObject:video];
                [[PersistManager instance] save];
                
            }];
            
            [clipDownloader1 start];
            
            break;
    }
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
        
        [requests addObject:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://109.90.191.143/videoQuiz/video/milkTray.mov"]]]; // http://192.168.0.105/videoQuiz/video/
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


#pragma mark Table View

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return thisUser.video.count;
}

- (UITableViewCell *)tableView:(UITableView *)view cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    UITableViewCell *cell = [view dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: @"cell"];
        
    }
    [cell.textLabel setText:fileNames[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)view didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [view dequeueReusableCellWithIdentifier:@"cell"];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [UIImage imageNamed:@"closedEye.png"];
    [imageView setNeedsDisplay];
}


- (void)tableView:(UITableView *)view didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [view dequeueReusableCellWithIdentifier:@"cell"];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [UIImage imageNamed:@"openEyeEye.png"];
    [imageView setNeedsDisplay];
}


@end
