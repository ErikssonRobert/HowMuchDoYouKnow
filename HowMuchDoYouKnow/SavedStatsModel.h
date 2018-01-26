//
//  SavedStatsModel.h
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-26.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SavedStatsModel : NSObject

- (void)saveRightsAnd:(int)points Wrongs:(int)wrong;

- (int)getPoints;

- (int)getWrongs;

@end
