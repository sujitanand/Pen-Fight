//
//  ViewController.m
//  PG
//
//  Created by sujit anand karkun on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize goToInstructionsButton,playRightAwayButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
-(IBAction)goToInstructions;
{
    UIStoryboard *story = self.storyboard;
    UIViewController *instructionsVC = [story instantiateViewControllerWithIdentifier:@"instructionsVC"];
    [self presentViewController:instructionsVC animated:YES completion:NULL];
}
#pragma mark - View lifecycle
-(IBAction)play;
{
    UIStoryboard *playBoard = self.storyboard;
    UIViewController *playGameVC = [playBoard instantiateViewControllerWithIdentifier:@"playGameVC"];
    [self presentViewController:playGameVC animated:YES completion:NULL];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
