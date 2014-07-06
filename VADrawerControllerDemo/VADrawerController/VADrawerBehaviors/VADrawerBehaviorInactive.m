//
//  VADrawerBehaviorInactive.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 31/03/14.
//
//

#import "VADrawerBehaviorInactive.h"
#import "VADrawerManager.h"

@implementation VADrawerBehaviorInactive 

- (void) tap:(CGPoint)touch
{
    [[VADrawerManager manager] prepareForSlideWithTouch:touch];
}

- (void) drag:(CGPoint)touch
{
    // this action will be called while dragging within the Inactive status
}

- (void) end:(CGPoint)touch
{
    // this action will be called while ending a gesture within the Inactive status
}

@end