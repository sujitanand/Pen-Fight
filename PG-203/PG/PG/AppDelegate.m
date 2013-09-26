//
//  AppDelegate.m
//  PG
//
//  Created by sujit anand karkun on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
//#import "Flurry.h"
//#import "Mixpanel.h"
@implementation AppDelegate

@synthesize window = _window;
-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    /*[Flurry startSession:@"WN3QM5WFRMPMZ87JGHXN"];
    [Flurry logEvent:@"oneFingerSwipeUp"];*/
    NSLog(@"Test");
   /* [Mixpanel sharedInstanceWithToken:@"3475cce2b361f0500883c6a294b7088b"];
    Mixpanel *mixpanel = [Mixpanel sharedInstance];
    [mixpanel track:@"oneFingerSwipeUp"];
    [mixpanel track:@"oneFingerSwipeDown"];*/
    
   // [Flurry logEvent:@"oneFingerSwipeUp"];
   /* NSArray *keys = [NSArray arrayWithObjects:@"key1",@"key1", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"",@"", nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil];*/
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
