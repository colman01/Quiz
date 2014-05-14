//
//  MultipleChoiceQuestionsViewController.h
//  VideoQuiz
//
//  Created by colman on 23.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"  
#import "QuizDao.h"
#import "PersistManager.h"

@interface MultipleChoiceQuestionsViewController : UIViewController

@property (strong, nonatomic) DmUser *thisUser;

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIButton *answer1;
@property (strong, nonatomic) IBOutlet UIButton *answer2;
@property (strong, nonatomic) IBOutlet UIButton *answer3;
@property (strong, nonatomic) IBOutlet UIButton *answer4;

@property (strong, nonatomic) DmQuestion *currentQuestion;

@property int totalQuestions;
@property int currentQuestionIndex;

@end
