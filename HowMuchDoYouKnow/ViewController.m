//
//  ViewController.m
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-24.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.questionList = [[REQuestionsSourceModel alloc] init];
    self.stats = [[SavedStatsModel alloc] init];
    [self startGame];
}

- (void)setDefaultValues {
    self.buttonGoToResults.hidden = YES;
    [self.questionList setDefaultValues];
}

- (void)startGame {
    [self setDefaultValues];
    [self.questionList getQuestionAndAnswers];
    [self setTextToLabelAndButtons];
}

- (void)getNextQuestion {
    [self.questionList getQuestionAndAnswers];
    [self setTextToLabelAndButtons];
}

- (void)setTextToLabelAndButtons {
    self.labelRightOrWrong.text = @"";
    self.labelQuestion.text = self.questionList.question;
    [self.buttonAnswer1 setTitle:self.questionList.answer1 forState:UIControlStateNormal];
    [self.buttonAnswer2 setTitle:self.questionList.answer2 forState:UIControlStateNormal];
    [self.buttonAnswer3 setTitle:self.questionList.answer3 forState:UIControlStateNormal];
    [self.buttonAnswer4 setTitle:self.questionList.answer4 forState:UIControlStateNormal];
}

- (IBAction)buttonAnswer1Pressed:(id)sender {
    [self disableButtons];
    [self isAnswerCorrect:self.questionList.answer1];
}

- (IBAction)buttonAnswer2Pressed:(id)sender {
    [self disableButtons];
    [self isAnswerCorrect:self.questionList.answer2];
}

- (IBAction)buttonAnswer3Pressed:(id)sender {
    [self disableButtons];
    [self isAnswerCorrect:self.questionList.answer3];
}

- (IBAction)buttonAnswer4Pressed:(id)sender {
    [self disableButtons];
    [self isAnswerCorrect:self.questionList.answer4];
}

- (void)isAnswerCorrect:(NSString*)guessedAnswer {
    self.labelRightOrWrong.text = [self.questionList isAnswerCorrect:guessedAnswer];
    if ([self.questionList isGameOver]) {
        self.buttonGoToResults.hidden = NO;
        [self.stats saveRightsAnd:self.questionList.points Wrongs:self.questionList.wrongs];
    }
}

- (IBAction)buttonNextQuestionPressed:(id)sender {
    [self enableButtons];
    [self getNextQuestion];
}

- (void)enableButtons {
    self.buttonAnswer1.enabled = YES;
    self.buttonAnswer2.enabled = YES;
    self.buttonAnswer3.enabled = YES;
    self.buttonAnswer4.enabled = YES;
    self.buttonNextQuestion.enabled = NO;
}

- (void)disableButtons {
    self.buttonAnswer1.enabled = NO;
    self.buttonAnswer2.enabled = NO;
    self.buttonAnswer3.enabled = NO;
    self.buttonAnswer4.enabled = NO;
    self.buttonNextQuestion.enabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
