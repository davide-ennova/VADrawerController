//
//  VADrawerBehaviorDragging.h
//  VADrawerController
//
//  Created by Vincenzo Alampi on 31/03/14.
//
//

#import <Foundation/Foundation.h>
#import "VADrawerBehavior.h"

@interface VADrawerBehaviorDragging : NSObject  <VADrawerBehavior>

@property (nonatomic) CGPoint startingDragPosition;
@property (nonatomic) NSTimeInterval startingDragTime;

@end