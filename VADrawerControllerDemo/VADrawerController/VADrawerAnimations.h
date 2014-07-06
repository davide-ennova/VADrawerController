//
//  VADrawerAnimations.h
//  VADrawerController
//
//  Created by Vincenzo Alampi on 20/03/14.
//  Copyright (c) 2014 Vincenzo Alampi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VADrawerManager.h"

@interface VADrawerAnimations : NSObject

+ (void) slide:(VADrawerController*)sideBar withAction:(DrawerAction)action;

@end