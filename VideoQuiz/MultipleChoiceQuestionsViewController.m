//
//  MultipleChoiceQuestionsViewController.m
//  VideoQuiz
//
//  Created by colman on 23.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "MultipleChoiceQuestionsViewController.h"
#import <objc/message.h>

@interface MultipleChoiceQuestionsViewController ()

@end

@implementation MultipleChoiceQuestionsViewController

@synthesize answer1, answer2, answer3, answer4, questionLabel;
@synthesize currentQuestion;
@synthesize currentQuestionIndex, totalQuestions;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated  {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0.1];
    
    [self shouldAutorotate];
    
    if(UIDeviceOrientationIsPortrait(self.interfaceOrientation)){
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
        {
            objc_msgSend([UIDevice currentDevice], @selector(setOrientation:), UIInterfaceOrientationLandscapeLeft );
            
            
        }
    }
    
}

- (void) viewDidAppear:(BOOL)animated{

    
    [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:")
                                   withObject:(__bridge id)((void*)UIInterfaceOrientationPortrait)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0.1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:0];
    
    //    Wait
//    [self performSegueWithIdentifier:@"Wait" sender:nil];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)checkAnswer:(UIButton *)sender {
    if (sender.tag == [currentQuestion.correctAnswer integerValue]) {
        //
        if (totalQuestions == currentQuestionIndex) {
            [self performSegueWithIdentifier:@"Feedback" sender:nil];
        }
    }
    
}


//- (IBAction) buttonWasPressed:(id) sender {
//    UIButton *button = sender;
//    int tag = button.tag;
//    Question * q = [allQuestions objectAtIndex:counter];
//    if (counter >= [allQuestions count]) {
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle: @"End game!"
//                              message:button.titleLabel.text
//                              delegate: nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil];
//        [alert show];
//        return;
//    }
//    if (tag == q.correct  ) {
//        
//        if (level == 0) {
//            level++;
//        }
//        score++;
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle: @"Correct"
//                              message:button.titleLabel.text
//                              delegate: nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil];
//        [alert show];
//        if (score == 17) {
//            level = 0;
//            counter = 0;
//            pause_ = NO;
//            return;
//        }
//        
//        counter++;
//        if (counter >= [allQuestions count]) {
//            counter = 0;
//        }
//        [self setTextForQuestion:counter];
//        [self resetBox];
//        pause_ = NO;
//    }
//    else {
//        level = 0;
//        counter = 0;
//        [self resetBox];
//        [self updateLevelText];
//        
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle: @"Incorrect!"
//                              message:button.titleLabel.text
//                              delegate: nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil];
//        [alert show];
//        [self showRestartCounterView];
//        [self setTextForQuestion:counter];
//        score = 0;
//    }
//}


#pragma mark Setup Questions

- (void) setTextForQuestion {
    DmQuestion *question = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    question.question = @"";
    question.answer1 = @"";
    question.answer2 = @"";
    question.answer3 = @"";
    question.answer4 = @"";
    question.correctAnswer = [NSNumber numberWithInt:0];
    question.isCorrectlyAnswered = [NSNumber numberWithInt:0];
}

@end
