//
//  VADrawerBehavior.h
//  VADrawerController
//
//  Created by Vincenzo Alampi on 31/03/14.
//
//

#import <Foundation/Foundation.h>

@protocol VADrawerBehavior <NSObject>

- (void) tap:(CGPoint)touch;
- (void) drag:(CGPoint)touch;
- (void) end:(CGPoint)touch;

@end