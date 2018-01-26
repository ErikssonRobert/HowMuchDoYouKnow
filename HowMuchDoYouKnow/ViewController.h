//
//  ViewController.h
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-24.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REQuestionsSourceModel.h"
#import "SavedStatsModel.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelQuestion;
@property (weak, nonatomic) IBOutlet UIButton *buttonAnswer1;
@property (weak, nonatomic) IBOutlet UIButton *buttonAnswer2;
@property (weak, nonatomic) IBOutlet UIButton *buttonAnswer3;
@property (weak, nonatomic) IBOutlet UIButton *buttonAnswer4;
@property (weak, nonatomic) IBOutlet UILabel *labelRightOrWrong;
@property (weak, nonatomic) IBOutlet UIButton *buttonNextQuestion;
@property (weak, nonatomic) IBOutlet UIButton *buttonGoToResults;

@property (nonatomic) REQuestionsSourceModel *questionList;
@property (nonatomic) SavedStatsModel *stats;

@end

