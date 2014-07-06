//
//  VADrawerManager.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 06/07/14.
//  Copyright (c) 2014 Vincenzo Alampi. All rights reserved.
//

#import "VADrawerManager.h"

@implementation VADrawerManager

#pragma mark CREATION

+ (id) manager
{
    static dispatch_once_t once;
    static id sharedController;
    dispatch_once(&once, ^{
        sharedController = [[self alloc] init];
    });
    
    return sharedController;
}

- (VADrawerTouchableWindow*) prepareWindow
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return [[VADrawerTouchableWindow alloc] initWithFrame:screenBounds];
}

- (void) attachDrawer:(VADrawerController*)drawer toViewController:(UIViewController*)viewController
{
    self.mainVC = viewController;
    self.drawer = drawer;
    
    [self.drawer setupDrawerController];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
 
    self.drawer.shadowView = [[UIView alloc] initWithFrame:screenRect];
    [self.drawer.shadowView setBackgroundColor:[UIColor blackColor]];
    [self.drawer.shadowView.layer setOpacity:0.0f];
        
    [[self.mainVC view] insertSubview:self.drawer.shadowView atIndex:99];
    [[self.mainVC view] insertSubview:self.drawer.view atIndex:10];
}

#pragma mark MANAGEMENT

- (void) prepareForSlideWithTouch:(CGPoint)touchPoint
{
    [[self.drawer drawerBehaviorDragging] setStartingDragPosition:touchPoint];
    [[self.drawer drawerBehaviorDragging] setStartingDragTime:([[NSDate date] timeIntervalSince1970] * 1000)];
}

- (void) shouldDrawerSlide:(CGPoint)point
{
    if ([self.drawer isActualState:Dragging])
        return;
    
    if (point.x > self.drawer.view.frame.size.width)
    {
        [self prepareForSlideWithTouch:point];
        return;
    }
    
    CGPoint start = [self.drawer drawerBehaviorDragging].startingDragPosition;
    
    float horizontal = abs(point.x - start.x);
    float vertical = abs(point.y - start.y);
    
    if ([self.drawer isActualState:Inactive] && [self.drawer drawerBehaviorDragging].startingDragPosition.x <= 20)
    {
        [self.drawer updateStateTo:Dragging];
    }
    else if ([self.drawer isActualState:Active] && horizontal > vertical && point.x > self.drawer.view.bounds.size.width/2)
    {
        [self.drawer updateStateTo:Dragging];
    }
}

@end