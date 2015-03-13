//
//  Podcast.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Podcast.h"

@implementation Podcast

- (instancetype)init {
    self = [super init];
    if (self) {
        _podcasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObject:(NSDictionary *)item {
    Podcast *podcast = [[Podcast alloc] init];
    [podcast setName:[item objectForKey:@"trackName"]];
    [podcast setTrackId:[item objectForKey:@"trackId"]];
    [podcast setArtista:[item objectForKey:@"artistName"]];
    [podcast setDuracao:[item objectForKey:@"trackTimeMillis"]];
    [podcast setGender:[item objectForKey:@"primaryGenreName"]];
    [podcast setPais:[item objectForKey:@"country"]];
    [_podcasts addObject:podcast];
}

@end
