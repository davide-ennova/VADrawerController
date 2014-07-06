//
//  AppDelegate.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 20/05/14.
//  Copyright (c) 2014 Vincenzo Alampi. All rights reserved.
//

#import "AppDelegate.h"
#import "VADrawerManager.h"
#import "ViewController.h"
#import "SideViewController.h"

@interface AppDelegate()

@property (strong, nonatomic) ViewController *viewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // 1. create both the MainViewController and SideViewControllers.
    
    self.viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MainController"];
    
    SideViewController *sideVC = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:[NSBundle mainBundle]]
                                  instantiateViewControllerWithIdentifier:@"SideViewController"];;
    
    // 2. prepare the window @property with the VADrawerManager.
    
    self.window = [[VADrawerManager manager] prepareWindow];
    
    // 3. attach the SideViewController to the MainViewController.
    
    [[VADrawerManager manager] attachDrawer:sideVC toViewController:self.viewController];

    // Done.
    
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void) applicationWillResignActive:(UIApplication *)application
{
    [[[VADrawerManager manager] drawer] checkSafetyPosition];
}

@end