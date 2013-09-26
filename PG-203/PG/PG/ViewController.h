//
//  ViewController.h
//  PG
//
//  Created by sujit anand karkun on 5/12/12.
//  Copyright (c) 2012 __MyCom/DCNFS/users/student/skarkun/Downloads/PenGame.xcodeprojpanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong,nonatomic) IBOutlet UIButton *goToInstructionsButton;
@property(strong,nonatomic) IBOutlet UIButton *playRightAwayButton;


-(IBAction)goToInstructions;
-(IBAction)play;

@end
