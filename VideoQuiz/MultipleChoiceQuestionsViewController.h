//
//  MultipleChoiceQuestionsViewController.h
//  VideoQuiz
//
//  Created by colman on 23.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultipleChoiceQuestionsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIButton *answer1;
@property (strong, nonatomic) IBOutlet UIButton *answer2;
@property (strong, nonatomic) IBOutlet UIButton *answer3;
@property (strong, nonatomic) IBOutlet UIButton *answer4;

@end
