//
//  VADrawerBehaviorActive.m
//  VADrawerController
//
//  Created by Vincenzo Alampi on 31/03/14.
//
//

#import "VADrawerBehaviorActive.h"
#import "VADrawerManager.h"

@implementation VADrawerBehaviorActive

- (void) tap:(CGPoint)touch
{
    [[VADrawerManager manager] prepareForSlideWithTouch:touch];
}

- (void) drag:(CGPoint)touch
{
    // this action will be called while dragging within the Active status
}

- (void) end:(CGPoint)touch
{
    if (touch.x > [[[VADrawerManager manager] drawer] view].frame.size.width)
    {
        [[[VADrawerManager manager] drawer] slideToClosed];
    }
}

@end