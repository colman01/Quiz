#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmUser;

@interface DmQuestion : NSManagedObject

@property (nonatomic, retain) NSString * answer1;
@property (nonatomic, retain) NSString * answer2;
@property (nonatomic, retain) NSString * answer3;
@property (nonatomic, retain) NSString * answer4;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSNumber * correctAnswer;
@property (nonatomic, retain) NSNumber * isCorrectlyAnswered;
@property (nonatomic, retain) DmUser *user;

@end
