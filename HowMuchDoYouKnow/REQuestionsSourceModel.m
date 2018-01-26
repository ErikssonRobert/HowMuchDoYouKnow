//
//  REQuestionsSourceModel.m
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-24.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "REQuestionsSourceModel.h"


@implementation REQuestionsSourceModel

//Questions array
- (NSArray*)setQuestion {
    NSArray *questions;
    questions = @[
                @{@"question": @"Vilken färg är Abu's hatt i Aladdin?",
                  @"answer1": @"Röd",
                  @"answer2": @"Rosa",
                  @"answer3": @"Lila",
                  @"answer4": @"Brun",
                  @"correctAnswer": @"Lila"
                },
                @{@"question": @"Hur många dvärgar bodde Snövit med?",
                  @"answer1": @"3",
                  @"answer2": @"7",
                  @"answer3": @"6",
                  @"answer4": @"8",
                  @"correctAnswer": @"7"
                },
                @{@"question": @"Vilket djur är Lille-John i Robin Hood?",
                  @"answer1": @"Panda",
                  @"answer2": @"Lejon",
                  @"answer3": @"Tjur",
                  @"answer4": @"Björn",
                  @"correctAnswer": @"Björn"
                },
                @{@"question": @"Vad heter professor Rottigans medhjälpare?",
                  @"answer1": @"Skrället",
                  @"answer2": @"Kräket",
                  @"answer3": @"Pelle",
                  @"answer4": @"Sir Päls",
                  @"correctAnswer": @"Skrället"
                },
                @{@"question": @"Vilken av följande filmer är INTE en Disney-klassiker?",
                  @"answer1": @"Taran och den magiska kitteln",
                  @"answer2": @"Fantasia 2000",
                  @"answer3": @"Vägen till Eldorado",
                  @"answer4": @"Pank och fågelfri",
                  @"correctAnswer": @"Vägen till Eldorado"
                },
                @{@"question": @"I vilken storstad håller Oliver och gänget till i?",
                  @"answer1": @"Miami",
                  @"answer2": @"New York",
                  @"answer3": @"San Francisco",
                  @"answer4": @"Los Angeles",
                  @"correctAnswer": @"New York"
                },
                @{@"question": @"Vad heter Max's stora idol i Janne Långben the Movie?",
                  @"answer1": @"Powerline",
                  @"answer2": @"Mr Cool",
                  @"answer3": @"Roxy Fox",
                  @"answer4": @"Pavorlane",
                  @"correctAnswer": @"Powerline"
                },
                @{@"question": @"Vad heter mannen som skapade alla Disney figurer?",
                  @"answer1": @"Roger Pain",
                  @"answer2": @"Walter Elias Disney",
                  @"answer3": @"Walter H Disney",
                  @"answer4": @"Walt Disney den andre",
                  @"correctAnswer": @"Walter Elias Disney"
                },
                @{@"question": @"Vad heter Babianen i Lejonkungen?",
                  @"answer1": @"Raffiki",
                  @"answer2": @"Diego",
                  @"answer3": @"Skar",
                  @"answer4": @"Zazu",
                  @"correctAnswer": @"Raffiki"
                },
                @{@"question": @"Vad heter Jafars djurvän?",
                  @"answer1": @"Abu",
                  @"answer2": @"Riki",
                  @"answer3": @"Jega",
                  @"answer4": @"Jago",
                  @"correctAnswer": @"Jago"
                }];
    return questions;
}

//Game Logic

- (void)setDefaultValues {
    self.pastQuestions = [NSMutableArray arrayWithObjects:@30, @30, @30, @30, @30, nil];
    self.questionNumber = 0;
    self.points = 0;
    self.wrongs = 0;
}

- (void)setQuestionsForThisRound:(NSNumber*)rand {
    self.question = [self setQuestion][rand.intValue][@"question"];
    self.answer1 = [self setQuestion][rand.intValue][@"answer1"];
    self.answer2 = [self setQuestion][rand.intValue][@"answer2"];
    self.answer3 = [self setQuestion][rand.intValue][@"answer3"];
    self.answer4 = [self setQuestion][rand.intValue][@"answer4"];
    self.answer = [self setQuestion][rand.intValue][@"correctAnswer"];
}

- (void)getQuestionAndAnswers {
    NSNumber *rand = [NSNumber numberWithInt:(arc4random_uniform(10))];
    BOOL newQuestion = NO;
    for (int i = 0; i < self.pastQuestions.count; i++) {
        if (rand.intValue != [self.pastQuestions[i] intValue]) {
            newQuestion = YES;
        }
        else {
            newQuestion = NO;
            break;
        }
    }
    if (newQuestion) {
        [self setQuestionsForThisRound:rand];
        self.pastQuestions[self.questionNumber] = rand;
        self.questionNumber++;
    }
    else {
        [self getQuestionAndAnswers];
    }
}

- (NSString*)isAnswerCorrect:(NSString*)guessedAnswer {
    if ([guessedAnswer isEqualToString:self.answer]) {
        self.points++;
        return @"Helt rätt!";
    }
    else {
        self.wrongs++;
        return @"Tyvärr, fel svar.";
    }
}

- (BOOL)isGameOver {
    if (self.questionNumber == 5) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
