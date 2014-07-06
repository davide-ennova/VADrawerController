//
//  VADrawerBehaviorDragging.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 31/03/14.
//
//

#import "VADrawerBehaviorDragging.h"
#import "VADrawerManager.h"

#define kMAX_Delta_Time 100
#define kMIN_Distance 10

@implementation VADrawerBehaviorDragging

- (void) tap:(CGPoint)touch
{
    // this action will be called while tapping within the Dragging status
}

- (void) drag:(CGPoint)touch
{
    CGPoint newPosition;
    
    CGFloat position_x;    
    CGFloat position_y = [[[VADrawerManager manager] drawer] view].center.y;
    
    if ([[[VADrawerManager manager] drawer] isPreviousState:Inactive])
    {
        position_x = [[[VADrawerManager manager] drawer] drawerStartingCenter].x + touch.x;
        newPosition = CGPointMake(position_x, position_y);
    }
    
    if ([[[VADrawerManager manager] drawer] isPreviousState:Active])
    {
        float newDiff = [self startingDragPosition].x - touch.x;
        
        position_x = [[[VADrawerManager manager] drawer] drawerEndingCenter].x - newDiff;
        
        if (position_x > [[[VADrawerManager manager] drawer] view].frame.size.width/2)
        {
            position_x = [[[VADrawerManager manager] drawer] view].frame.size.width/2;
        }
        
        newPosition = CGPointMake(position_x, position_y);
    }
    
    if (touch.x < [[[VADrawerManager manager] drawer] view].frame.size.width)
    {
        [[[VADrawerManager manager] drawer] updateDrawerPosition:newPosition];
    }
}

- (void) end:(CGPoint)touch
{
    int distance = abs([self startingDragPosition].x - touch.x);
    NSTimeInterval actualTime = ([[NSDate date] timeIntervalSince1970] * 1000);
    float diffTime = abs([self startingDragTime] - actualTime);

    BOOL fastMovement = (diffTime < kMAX_Delta_Time && distance >= kMIN_Distance);
    BOOL endCloseToLeft = touch.x <= [[[VADrawerManager manager] drawer] view].frame.size.width/2;
    
    if (fastMovement && [[[VADrawerManager manager] drawer] isPreviousState:Inactive])
    {
        [[[VADrawerManager manager] drawer] slideToOpen];
        return;
    }
    
    if (fastMovement && [[[VADrawerManager manager] drawer] isPreviousState:Active])
    {
        [[[VADrawerManager manager] drawer] slideToClosed];
        return;
    }
    
    endCloseToLeft ? [[[VADrawerManager manager] drawer] slideToClosed] : [[[VADrawerManager manager] drawer] slideToOpen];
}

@end