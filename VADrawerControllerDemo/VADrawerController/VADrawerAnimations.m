//
//  VADrawerAnimations.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 21/03/14.
//  Copyright (c) 2014 Vincenzo Alampi. All rights reserved.
//

#import "VADrawerAnimations.h"

@implementation VADrawerAnimations

+ (void) slide:(VADrawerController*)sideBar withAction:(DrawerAction)action
{
    [[[VADrawerManager manager] drawer] updateStateTo:Animating];

    CGPoint newPosition = CGPointMake([sideBar drawerEndingCenter].x, [sideBar drawerEndingCenter].y);
    DrawerState newState = Active;
    
    if (action == Close)
    {
        newPosition = CGPointMake([sideBar drawerStartingCenter].x, [sideBar drawerStartingCenter].y);
        newState = Inactive;
    }
    
    [UIView animateWithDuration: 0.2
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [sideBar updateDrawerPosition:newPosition];
                     }
                     completion: ^(BOOL finished) {
                         [[[VADrawerManager manager] drawer] updateStateTo:newState];

    }];
}

@end