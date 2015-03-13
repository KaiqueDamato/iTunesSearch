//
//  Music.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/11/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Music.h"

@implementation Music

- (NSMutableArray *)busca:(NSDictionary *)dicionario {
    NSArray *resultados = [dicionario objectForKey:@"results"];
    NSMutableArray *musics = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Music *music = [[Music alloc] init];
        [music setNome:[item objectForKey:@"trackName"]];
        [music setTrackId:[item objectForKey:@"trackId"]];
        [music setArtista:[item objectForKey:@"artistName"]];
        [music setDuracao:[item objectForKey:@"trackTimeMillis"]];
        [music setGenero:[item objectForKey:@"primaryGenreName"]];
        [music setPais:[item objectForKey:@"country"]];
        [musics addObject:music];
    }
    return musics;
}

@end
