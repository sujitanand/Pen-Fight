//
//  highScoreView.h
//  PG
//
//  Created by sujit anand karkun on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface highScoreView : UIViewController <UITableViewDataSource>
{
    NSMutableArray *highScoreData;
}
@property(strong,nonatomic) IBOutlet UIButton *goBackToMainMenuFromHighScores;
@property(strong,nonatomic) NSMutableArray *highScoreData;


-(IBAction)goBackToMainMenuFromHighScoresMethod;
@end
