//
//  iTunesManager.h
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Midia.h"

@interface iTunesManager : NSObject

@property Midia *midia;

+ (iTunesManager*)sharedInstance;

- (void)buscarMidias:(NSString *)termo;

@end
