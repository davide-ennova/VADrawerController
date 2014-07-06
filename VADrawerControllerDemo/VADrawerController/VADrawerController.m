//
//  VADrawerController.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 26/03/14.
//
//

#import "VADrawerController.h"
#import "VADrawerAnimations.h"

@interface VADrawerController ()

@property (nonatomic) DrawerState actualState;
@property (nonatomic) DrawerState previousState;

@end

@implementation VADrawerController

#pragma mark SETUP

- (void) setupDrawerController
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGPoint center = CGPointMake(- self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    [self.view setCenter:center];
    [self setDrawerStartingCenter:self.view.center];
    [self setDrawerEndingCenter:CGPointMake(self.view.center.x + self.view.frame.size.width, self.view.center.y)];
    
    [self.view.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.view.layer setShadowRadius:1.8];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.view.frame.size.width +3 , screenRect.size.height +5) cornerRadius:0.0];
    
    [self.view.layer setShadowPath:bezierPath.CGPath];
    
    self.drawerBehaviorInactive = [[VADrawerBehaviorInactive alloc] init];
    self.drawerBehaviorActive = [[VADrawerBehaviorActive alloc] init];
    self.drawerBehaviorDragging = [[VADrawerBehaviorDragging alloc] init];
    
    [self updateStateTo:Inactive];
}

#pragma mark SLIDE

- (void) slideToOpen
{
    [VADrawerAnimations slide:self withAction:Open];
}

- (void) slideToClosed
{
    [VADrawerAnimations slide:self withAction:Close];
}

#pragma mark CHECK

- (BOOL) isActualState:(DrawerState)state
{
    return (state == self.actualState);
}

- (BOOL) isPreviousState:(DrawerState)state
{
    return (state == self.previousState);
}

- (void) checkSafetyPosition
{
    if (self.view.center.x > [self drawerStartingCenter].x && self.view.center.x < [self view].frame.size.width/2)
    {
        [self slideToClosed];
    }
    else if (self.view.center.x > [self drawerStartingCenter].x + [self view].frame.size.width && self.view.center.x < [self view].frame.size.width)
    {
        [self slideToOpen];
    }
}

#pragma mark UPDATE

- (void) updateShadowStatus
{
    float opacity = [self isActualState:Inactive] ? 0.0f : 0.6f;
    [self.view.layer setShadowOpacity:opacity];
}

- (void) updateGradientBackgorund:(CGFloat)amount
{
    float position = amount + self.view.frame.size.width/2;
    float a = 0.7 / self.view.frame.size.width;
    
    float total = position * a;
    
    [self.shadowView.layer setOpacity:total];
}


- (void) updateStateTo:(DrawerState) state
{
    [self setPreviousState:self.actualState];
    [self setActualState:state];
    
    switch (state)
    {
        case Inactive:
        {
            [self setBehavior:self.drawerBehaviorInactive];
            [self checkSafetyPosition];
            break;
        }
        case Active:
        {
            [self setBehavior:self.drawerBehaviorActive];
            [self checkSafetyPosition];
            break;
        }
        case Dragging:
        {
            [self setBehavior:self.drawerBehaviorDragging];
            break;
        }
        default:
            break;
    }
    
    [self updateShadowStatus];
}

- (void) updateDrawerPosition:(CGPoint)position
{
    [self.view setCenter:position];
    [self updateGradientBackgorund:position.x];
}

@end