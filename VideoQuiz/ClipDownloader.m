//
//  ClipDownloader.m
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "ClipDownloader.h"

@implementation ClipDownloader
@synthesize _responseData;
@synthesize button;

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    NSLog(@"did response");
//    UIImage *img = [UIImage imageNamed:@"clipready.png"];
//    button.imageView.image = img;
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    NSLog(@"did finsih");
//    [button setBackgroundImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
//    answer1 = brown;
//    answer2 = "not brown";
//    answer3 = white;
//    answer4 = black;
//    correctAnswer = 1;
//    feedbackInputAnswer = "";
//    feedbackQuestion = "do you like chocolate";
//    optionAnswer1 = tasty;
//    optionAnswer2 = "not tasty";
//    optionAnswer3 = sweet;
//    optionAnswer4 = sour;
//    optionQuestion = "What is chocolate";
//    optionSelected = 0;
//    question = "what color is chocolate";
//    "quiz_id" = 1;
//    rating = 0;
    
    UIImage *img = [UIImage imageNamed:@"clipready.png"];
    button.imageView.image = img;
    
    NSLog(@"%@" , [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding]);
    NSData *data = [[NSData alloc] initWithData:_responseData];
    NSError *error;
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (id element in dict) {
        [dataArray addObject:element];
    }
//    NSLog(@"%@", [dataArray objectAtIndex:0]);
    
    DmUser *thisUser = [[QuizDao instance] currentUser];
    
    NSMutableDictionary *dictValues = [dataArray objectAtIndex:0];
//    NSLog(@"%@", [dictValues objectForKey:@"question"]);
    
    int num = (int)[dictValues objectForKey:@"correctAnswer"] ;
    DmProduct *product = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    
    
    product.question = [dictValues objectForKey:@"optionQuestion"];
    product.answer1 = [dictValues objectForKey:@"optionAnswer1"];
    product.answer2 = [dictValues objectForKey:@"optionAnswer2"];
    product.answer3 = [dictValues objectForKey:@"optionAnswer3"];
    thisUser.productQuestion = product;
    
    
    DmQuestion *question = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    
    question.question = [dictValues objectForKey:@"optionQuestion"];
    question.answer1 = [dictValues objectForKey:@"answer1"];
    question.answer2 = [dictValues objectForKey:@"answer2"];
    question.answer3 = [dictValues objectForKey:@"answer3"];
    question.answer4 = [dictValues objectForKey:@"answer4"];
    question.correctAnswer = [NSNumber numberWithInt:num] ;
    question.isCorrectlyAnswered = NO;
    [thisUser addQuestionObject:question];
    
    DmSingle *feedbackQuestion = [NSEntityDescription insertNewObjectForEntityForName:@"Single" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    
    feedbackQuestion.question = [dictValues objectForKey:@"feedbackQuestion"];
    thisUser.feedbackQuestion = feedbackQuestion;
    
    
    
    
    

    
    [[PersistManager instance] save];
//    self.handler(@"some response data");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Fail");
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1.0;
    
    // The request has failed for some reason!
    // Check the error var
}

#pragma mark

- (void) onComplete:(SelectCompletionHandler) handler {
	self.handler = handler;
}

@end
