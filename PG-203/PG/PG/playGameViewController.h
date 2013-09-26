//
//  playGameViewController.h
//  PG
//
//  Created by sujit anand karkun on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <GameKit/GameKit.h>



@interface playGameViewController : UIViewController<UIGestureRecognizerDelegate>
{
    IBOutlet UIImageView *playerOne;
    IBOutlet UIImageView *playerTwo;
    IBOutlet UIView *woodenRectangleTable;
    IBOutlet UIAlertView *gameOver;
    IBOutlet UILabel *playerTurn;
    BOOL userAuthenticated;
    BOOL isMoving;
    CGPoint previousLocation;
    BOOL whosTurn;
}
@property(strong,nonatomic) IBOutlet UIButton *goBack;
@property(strong,nonatomic) IBOutlet UIImageView *playerOne;
@property(strong,nonatomic) IBOutlet UIImageView *playerTwo;
@property(strong,nonatomic) IBOutlet UIView *woodenRectangleTable;
@property(strong,nonatomic) IBOutlet UILabel *playerTurn;
@property(strong,nonatomic) NSString *labelString;

@property float xcoor;
@property float ycoor;
@property float xPlayerTwo;
@property float yPlayerTwo;


-(IBAction)movePensUp:(UIGestureRecognizer *)oneFingerSwipeUp;
-(IBAction)movePensDown:(UIGestureRecognizer *)oneFingerSwipeDown;
-(IBAction)movePensLeft:(UIGestureRecognizer *)oneFingerSwipeLeft;
-(IBAction)movePensRight:(UIGestureRecognizer *)oneFingerSwipeRight;
-(void)whosturnLabel;

-(IBAction)gob;

-(void)hitsPens;




@end
