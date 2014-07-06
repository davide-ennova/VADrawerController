//
//  VADrawerManager.h
//  VADrawerController
//
//  Created by Vincenzo Alampi on 06/07/14.
//  Copyright (c) 2014 Vincenzo Alampi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VADrawerController.h"
#import "VADrawerTouchableWindow.h"

@interface VADrawerManager : NSObject

@property (strong, nonatomic) UIViewController *mainVC;
@property (strong, nonatomic) VADrawerController *drawer;

+ (id) manager;

- (VADrawerTouchableWindow*) prepareWindow;
- (void) attachDrawer:(VADrawerController*)drawer toViewController:(UIViewController*)viewController;

- (void) prepareForSlideWithTouch:(CGPoint)touchPoint;
- (void) shouldDrawerSlide:(CGPoint)point;

@end