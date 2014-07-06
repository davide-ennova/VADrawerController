//
//  VADrawerController.h
//  VADrawerController
//
//  Created by Vincenzo Alampi on 26/03/14.
//
//

#import <UIKit/UIKit.h>
#import "VADrawerBehavior.h"
#import "VADrawerBehaviorInactive.h"
#import "VADrawerBehaviorActive.h"
#import "VADrawerBehaviorDragging.h"

typedef enum {

    Inactive,
    Active,
    Dragging,
    Animating
    
} DrawerState;

typedef enum {
    
    Open,
    Close,
    
} DrawerAction;

@interface VADrawerController : UIViewController

@property (strong, nonatomic) UIView *shadowView;

@property (strong, nonatomic) id<VADrawerBehavior> behavior;

@property (strong, nonatomic) VADrawerBehaviorInactive *drawerBehaviorInactive;
@property (strong, nonatomic) VADrawerBehaviorActive *drawerBehaviorActive;
@property (strong, nonatomic) VADrawerBehaviorDragging *drawerBehaviorDragging;

@property (nonatomic) CGPoint drawerStartingCenter;
@property (nonatomic) CGPoint drawerEndingCenter;

- (void) setupDrawerController;

- (void) slideToOpen;
- (void) slideToClosed;

- (BOOL) isActualState:(DrawerState)state;
- (BOOL) isPreviousState:(DrawerState)state;
- (void) checkSafetyPosition;

- (void) updateDrawerPosition:(CGPoint)position;
- (void) updateStateTo:(DrawerState)state;

@end