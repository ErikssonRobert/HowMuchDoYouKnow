//
//  REQuestionsSourceModel.h
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-24.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REQuestionsSourceModel : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSString *answer1;
@property (nonatomic) NSString *answer2;
@property (nonatomic) NSString *answer3;
@property (nonatomic) NSString *answer4;
@property (nonatomic) NSString *answer;

@property (nonatomic) NSMutableArray *pastQuestions;
@property (nonatomic) int questionNumber;
@property (nonatomic) int points;
@property (nonatomic) int wrongs;

- (NSArray*)setQuestion;
- (void)setDefaultValues;
- (void)setQuestionsForThisRound;
- (void)getQuestionAndAnswers;
- (NSString*)isAnswerCorrect:(NSString*)guessedAnswer;


@end
