//
//  QuitWs.h
//  VideoQuiz
//
//  Created by colman on 22.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "WsBase.h"
#import "DmUser.h"
#import "KeychainItemWrapper.h"

@interface QuizWs : WsBase

- (void) refreshList;
- (void) sendResponse:(DmUser *) inspection;
- (void) clearUserData;

@end
