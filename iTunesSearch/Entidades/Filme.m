//
//  Filme.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Filme.h"

@implementation Filme

- (instancetype)init {
    self = [super init];
    if (self) {
        _filmes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObject:(NSDictionary *)item {
    Filme *filme = [[Filme alloc] init];
    [filme setName:[item objectForKey:@"trackName"]];
    [filme setTrackId:[item objectForKey:@"trackId"]];
    [filme setArtista:[item objectForKey:@"artistName"]];
    [filme setDuracao:[item objectForKey:@"trackTimeMillis"]];
    [filme setGender:[item objectForKey:@"primaryGenreName"]];
    [filme setPais:[item objectForKey:@"country"]];
    [filme setImagemItunes:[item objectForKey:@"artworkUrl100"]];
    [_filmes addObject:filme];
}

@end
