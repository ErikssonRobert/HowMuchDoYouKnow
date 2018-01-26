//
//  SavedStatsModel.m
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-26.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "SavedStatsModel.h"
#import <UIKit/UIKit.h>

@implementation SavedStatsModel

- (void)saveRightsAnd:(int)points Wrongs:(int)wrong{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:points forKey:@"points"];
    [defaults setInteger:wrong forKey:@"wrong"];
}

- (int)getPoints {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (int)[defaults integerForKey:@"points"];
}

- (int)getWrongs {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (int)[defaults integerForKey:@"wrong"];
}

@end
