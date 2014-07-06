//
//  VADrawerTouchableWindow.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 11/04/14.
//
//

#import "VADrawerTouchableWindow.h"
#import "VADrawerManager.h"

@implementation VADrawerTouchableWindow

- (void)sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject] ;
    CGPoint location = [touch locationInView: [UIApplication sharedApplication].keyWindow];
    
    if (![self isValidDrawerEvent:event withTouch:touch])
    {
        return;
    }
    
    if ([touch phase] == UITouchPhaseBegan)
    {
        [[[[VADrawerManager manager] drawer] behavior] tap:location];
    }
    
    if ([touch phase] == UITouchPhaseMoved )
    {
        [[VADrawerManager manager] shouldDrawerSlide:location];
        [[[[VADrawerManager manager] drawer] behavior] drag:location];
    }

    if ([touch phase] == UITouchPhaseEnded)
    {
        [[[[VADrawerManager manager] drawer] behavior] end:location];
    }
}

- (BOOL) isValidDrawerEvent:(UIEvent*)event withTouch:(UITouch*)touch
{
    
    if ([[[VADrawerManager manager] drawer] isActualState:Animating])
    {
        return NO;
    }
    
    if ([touch.view isKindOfClass: UIControl.class] || [event allTouches].count > 1)
    {
        return NO;
    }

    return YES;
}

@end