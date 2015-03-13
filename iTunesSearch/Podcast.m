//
//  Podcast.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Podcast.h"

@implementation Podcast

- (NSMutableArray *)busca:(NSDictionary *)dicionario {
    NSArray *resultados = [dicionario objectForKey:@"results"];
    NSMutableArray *podcasts = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Podcast *podcast = [[Podcast alloc] init];
        [podcast setNome:[item objectForKey:@"trackName"]];
        [podcast setTrackId:[item objectForKey:@"trackId"]];
        [podcast setArtista:[item objectForKey:@"artistName"]];
        [podcast setDuracao:[item objectForKey:@"trackTimeMillis"]];
        [podcast setGenero:[item objectForKey:@"primaryGenreName"]];
        [podcast setPais:[item objectForKey:@"country"]];
        [podcasts addObject:podcast];
    }
    return podcasts;
}

@end
