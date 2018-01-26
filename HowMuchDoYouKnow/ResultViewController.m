//
//  ResultViewController.m
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-26.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelRights;
@property (weak, nonatomic) IBOutlet UILabel *labelWrongs;

@property (nonatomic) int points;
@property (nonatomic) int wrongs;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.stats = [[SavedStatsModel alloc] init];
    self.points = [self.stats getPoints];
    self.wrongs = [self.stats getWrongs];
    self.labelRights.text = [NSString stringWithFormat:@"%d", self.points];
    self.labelWrongs.text = [NSString stringWithFormat:@"%d", self.wrongs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
