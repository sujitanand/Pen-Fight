//
//  playGameViewController.m
//  PG
//
//  Created by sujit anand karkun on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "playGameViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation playGameViewController

CGPoint destinationPoint;
CGFloat xpos,ypos;
CGFloat Speed = 40;


@synthesize goBack,playerOne,playerTwo,woodenRectangleTable,xcoor,ycoor,xPlayerTwo,yPlayerTwo,playerTurn,labelString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)gob
{
    UIStoryboard *viewControl = self.storyboard;
    UIViewController *viewVC = [viewControl instantiateViewControllerWithIdentifier:@"viewVC"];
    [self presentViewController:viewVC animated:YES completion:NULL];

    
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
/*- (void)loadView
{
    
}*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
// Initialized Swipe Gesture Recognizers for both Player One and Player Two
- (void)viewDidLoad
{
    self.xcoor = playerOne.frame.origin.x;
    self.ycoor = playerOne.frame.origin.y;
    
    self.xPlayerTwo = playerTwo.frame.origin.x;
    self.yPlayerTwo = playerTwo.frame.origin.y;
       
    
       
     [super viewDidLoad];
  
    whosTurn = YES;
    
      
    UISwipeGestureRecognizer *oneFingerSwipeUp=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(movePensUp:)];
    [oneFingerSwipeUp setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:oneFingerSwipeUp];
    
    UISwipeGestureRecognizer *oneFingerSwipeDown=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(movePensDown:)];
    oneFingerSwipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(movePensDown:)];
    [oneFingerSwipeDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view]addGestureRecognizer:oneFingerSwipeDown];
    
    UISwipeGestureRecognizer *oneFingerSwipeRight=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(movePensRight:)];
    oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(movePensRight:)];
    [oneFingerSwipeRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view]addGestureRecognizer:oneFingerSwipeRight];

    UISwipeGestureRecognizer *oneFingerSwipeLeft=[[UISwipeGestureRecognizer alloc] initWithTarget:playerOne action:@selector(movePensLeft:)];
    oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(movePensLeft:)];
    [oneFingerSwipeLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    
            
    [[self view]addGestureRecognizer:oneFingerSwipeLeft];
    oneFingerSwipeLeft.delegate = (id)self;
    [[self view] addGestureRecognizer:oneFingerSwipeUp];
    oneFingerSwipeUp.delegate=(id)self;
    [[self view] addGestureRecognizer:oneFingerSwipeDown];
    oneFingerSwipeDown.delegate=(id)self;
    [[self view] addGestureRecognizer:oneFingerSwipeRight];
    oneFingerSwipeRight.delegate=(id)self;
      
    
        
   
    
}
-(void)whosturnLabel
{
    
    if(whosTurn == YES)
    {
        labelString = @"PLAYER ONE";
        playerTurn.text = labelString;
        //NSLog(@"PLAYER ONE");
    }
    else if(whosTurn == NO)
    {
        labelString = @"PLAYER TWO";
        playerTurn.text = labelString;
        //NSLog(@"PLAYER TWO");
    }

}


 //SWIPE GESTURE RECOGNIZER FOR BOTH PLAYERS
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //[self whosTurn];
 
    
    CGPoint t;
    t = [touch locationInView:self.view];
   
    
        if((t.x >= playerOne.frame.origin.x  && t.x <=playerOne.frame.size.width + playerOne.frame.size.width && t.y >=playerOne.frame.origin.y && t.y<=playerOne.frame.size.height + playerOne.frame.origin.y) && (whosTurn == YES))
        {
            return YES;
                       
        }
    
        else if((t.x >= playerTwo.frame.origin.x  && t.x <=playerTwo.frame.size.width + playerTwo.frame.size.width && t.y >=playerTwo.frame.origin.y && t.y<=playerTwo.frame.size.height + playerTwo.frame.origin.y)&& (whosTurn == NO))
        {

            return YES;
        }
    
        else
            return NO;
           
   
}
// ALERT VIEW CONTROLLER
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        UIStoryboard *playBoard = self.storyboard;
        UIViewController *playGameVC = [playBoard instantiateViewControllerWithIdentifier:@"playGameVC"];
        [self presentViewController:playGameVC animated:YES completion:NULL];
    }
    else if(buttonIndex ==1)
    {
        UIStoryboard *viewControl = self.storyboard;
        UIViewController *viewVC = [viewControl instantiateViewControllerWithIdentifier:@"viewVC"];
        [self presentViewController:viewVC animated:YES completion:NULL];
    }
}




//SWIPE UP FOR PLAYERS

-(IBAction)movePensUp:(UIGestureRecognizer *)oneFingerSwipeUp
{
   
    if(whosTurn == YES){
        [self whosturnLabel];
            
            
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
        
      
        
                  
        self.playerOne.frame = CGRectMake(xcoor,ycoor - 30.0, 123.0, 70.0);
         
    if(playerOne.frame.origin.x > 235.0 )
    {
        gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
        [gameOver show];

           }
    else if(playerOne.frame.origin.x < 60.0)
    {
        gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
        [gameOver show];
          }
    else if(playerOne.frame.origin.y > 345.0)
    {
        gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
        [gameOver show];
           }
    else if(playerOne.frame.origin.y < 80.0)
    {
        gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
        [gameOver show];
       
    }
        
        xcoor = playerOne.frame.origin.x;
        ycoor = playerOne.frame.origin.y;
        
        

          }completion:nil];
    [self hitsPens];
      
   
        
    
   
    
         
        whosTurn = NO;
        

        
   
    }
    else{
        [self whosturnLabel];
               

        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
            
                       
            
            self.playerTwo.frame = CGRectMake(xPlayerTwo,yPlayerTwo - 30.0, 123.0, 70.0);
                          if(playerTwo.frame.origin.x > 235.0 )
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                    
                   
               }
               else if(playerTwo.frame.origin.x < 60.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
               }
                else if(playerTwo.frame.origin.y > 345.0)
               {
                   gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                   [gameOver show];
                                 }
                else if(playerTwo.frame.origin.y < 80.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
            
           xPlayerTwo = playerTwo.frame.origin.x;
           yPlayerTwo = playerTwo.frame.origin.y;
            
            
            
                    }completion:nil];
        [self hitsPens];
        
        
        
        
        
        
               whosTurn = YES;
        
        
        
        
        
        
    }
    
    
    
  
           
}

// SWIPE DOWN FOR PLAYERS

-(IBAction)movePensDown:(UIGestureRecognizer *)oneFingerSwipeDown
{
    
        
    if(whosTurn == YES){
        [self whosturnLabel];
               
        
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
            
                       
            
            self.playerOne.frame = CGRectMake(xcoor,ycoor +30.0, 123.0, 70.0);
           
                if(playerOne.frame.origin.x > 235.0 )
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
                else if(playerOne.frame.origin.x < 60.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                    
                }
                else if(playerOne.frame.origin.y > 345.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
                else if(playerOne.frame.origin.y < 80.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
            
            xcoor = playerOne.frame.origin.x;
            ycoor = playerOne.frame.origin.y;
            
            
            
                   }completion:nil];
        [self hitsPens];
        
        
        
        
        
        
        //NSLog(@"Swiping Up");
        whosTurn = NO; 
       

        
    }
    else{
        [self whosturnLabel];
               
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
            
         
            
            
            self.playerTwo.frame = CGRectMake(xPlayerTwo,yPlayerTwo+30.0, 123.0, 70.0); 
          
                if(playerTwo.frame.origin.x > 235.0 )
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                    
                }
                else if(playerTwo.frame.origin.x < 60.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
                else if(playerTwo.frame.origin.y > 345.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
               }
                else if(playerTwo.frame.origin.y < 80.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
            
            
            xPlayerTwo = playerTwo.frame.origin.x;
            yPlayerTwo = playerTwo.frame.origin.y;
            
            
            
           
        }completion:nil];
        [self hitsPens];
        
        
        
        
        
        
               whosTurn = YES;
              
        
        
        
        
    }
    
     
    
}
    
//SWIPE RIGHT FOR PLAYERS
    

-(IBAction)movePensRight:(UIGestureRecognizer *)oneFingerSwipeRight
{
     [self whosturnLabel];
    
          
    if(whosTurn == YES){
        [self whosturnLabel];
                

        
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
            
                       
            
            self.playerOne.frame = CGRectMake(xcoor+30.0,ycoor, 123.0, 70.0);
                           if(playerOne.frame.origin.x > 235.0 )
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
                else if(playerOne.frame.origin.x < 60.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
                else if(playerOne.frame.origin.y > 345.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
                else if(playerOne.frame.origin.y < 80.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
            
            xcoor = playerOne.frame.origin.x;
            ycoor = playerOne.frame.origin.y;
            
            
            
          
        }completion:nil];
        [self hitsPens];
        
        
        
        
        
        
              whosTurn = NO;
        
         
    }
    else{
        [self whosturnLabel];
                

        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
            
           
            
            
            self.playerTwo.frame = CGRectMake(xPlayerTwo+30.0,yPlayerTwo, 123.0, 70.0); 
           
                if(playerTwo.frame.origin.x > 235.0 )
               {
                   gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                   [gameOver show];
                                   }
                else if(playerTwo.frame.origin.x < 60.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
                else if(playerTwo.frame.origin.y > 345.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
                else if(playerTwo.frame.origin.y < 80.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
            
            
            xPlayerTwo = playerTwo.frame.origin.x;
            yPlayerTwo = playerTwo.frame.origin.y;
            
            
            
                    }completion:nil];
        [self hitsPens];
        
        
        
        
        
        
               whosTurn = YES; 
       
         
        
        
        
        
    }
    
    

}
//SWIPE LEFT FOR PLAYERS
-(IBAction)movePensLeft:(UIGestureRecognizer *)oneFingerSwipeLeft
{  
    
    if(whosTurn == YES){
        [self whosturnLabel];               
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
           
            
            
            self.playerOne.frame = CGRectMake(xcoor-30.0,ycoor, 123.0, 70.0);
                           if(playerOne.frame.origin.x > 235.0 )
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                   
                }
                else if(playerOne.frame.origin.x < 60.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                    
                }
                else if(playerOne.frame.origin.y > 345.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                  
                }
                else if(playerOne.frame.origin.y < 80.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player One Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                    
                }
            
            
            xcoor = playerOne.frame.origin.x;
            ycoor = playerOne.frame.origin.y;
            
            
            
           
        }completion:nil];
        [self hitsPens];
        
        
        
        
        
        
       
        whosTurn = NO;
       
        
    }
    else{
        [self whosturnLabel];
        
        

        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
            
                      
            
            self.playerTwo.frame = CGRectMake(xPlayerTwo-30.0,yPlayerTwo, 123.0, 70.0); 
                          if(playerTwo.frame.origin.x > 235.0 )
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
                else if(playerTwo.frame.origin.x < 60.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                    
                }
                else if(playerTwo.frame.origin.y > 345.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                                   }
                else if(playerTwo.frame.origin.y < 80.0)
                {
                    gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"Player Two Out of Bounds!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                    [gameOver show];
                    
                }
            
            
            xPlayerTwo = playerTwo.frame.origin.x;
            yPlayerTwo = playerTwo.frame.origin.y;
            
            
            
           
        }completion:nil];
        [self hitsPens];
        
        
        
        
        
        
        
        whosTurn = YES; 
       
         
        
        
        
        
    }
    
    
}

//STRIKING PENS METHOD


-(void)hitsPens
{
    if(CGRectIntersectsRect(CGRectMake(playerOne.frame.origin.x, playerOne.frame.origin.y, 123.0,10), CGRectMake(playerTwo.frame.origin.x, playerTwo.frame.origin.y, 123, 10)) )
    {
        
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
            
           
        self.playerOne.frame = CGRectMake(xcoor, ycoor+100.0, 123.0, 70.0);
            self.playerTwo.frame = CGRectMake(xPlayerTwo, yPlayerTwo-100.0, 123.0, 70.0);
            gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"You Win!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
            [gameOver show];
        }completion:nil];
                  
       
         if(playerOne.frame.origin.y == playerTwo.frame.origin.x)
        {
            
            [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
                
                               
                self.playerOne.frame = CGRectMake(xcoor, ycoor+100.0, 123.0, 70.0);
                 gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"You Win!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                [gameOver show];
            }completion:nil];
            
        }
        else if(playerOne.frame.origin.x == playerTwo.frame.origin.y)
        {
            
            [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseInOut |UIViewAnimationOptionTransitionFlipFromBottom| UIViewAnimationOptionAllowUserInteraction animations:^{
                
                               
                self.playerOne.frame = CGRectMake(xcoor, ycoor+100.0, 123.0, 70.0);
                 gameOver = [[UIAlertView alloc]initWithTitle:@"Game Over!!" message:@"You Win!!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Main Menu", nil];
                [gameOver show];
            }completion:nil];
           
        }

        
    }
        
}








   
-(void) viewDidUnload
{
    [super viewDidUnload];
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
    

@end
