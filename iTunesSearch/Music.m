//
//  Music.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/11/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Music.h"

@implementation Music

- (instancetype)init {
    self = [super init];
    if (self) {
        _musicas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObject:(NSDictionary *)item {
    Music *music = [[Music alloc] init];
    [music setName:[item objectForKey:@"trackName"]];
    [music setTrackId:[item objectForKey:@"trackId"]];
    [music setArtista:[item objectForKey:@"artistName"]];
    [music setDuracao:[item objectForKey:@"trackTimeMillis"]];
    [music setGender:[item objectForKey:@"primaryGenreName"]];
    [music setPais:[item objectForKey:@"country"]];
    [music setImagemItunes:[item objectForKey:@"artworkUrl100"]];
    [_musicas addObject:music];
}

@end
