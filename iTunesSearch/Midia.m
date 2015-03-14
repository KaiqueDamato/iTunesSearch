//
//  Midia.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Midia.h"

@implementation Midia

static Midia *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _dictionary = [[NSDictionary alloc] init];
        _keys = @[@"filme",@"musica",@"podcast",@"ebook"];
    }
    return self;
}

@end
