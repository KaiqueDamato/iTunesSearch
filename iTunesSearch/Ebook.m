//
//  Ebook.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Ebook.h"

@implementation Ebook

- (NSMutableArray *)busca:(NSDictionary *)dicionario {
    NSArray *resultados = [dicionario objectForKey:@"results"];
    NSMutableArray *ebooks = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in resultados) {
        Ebook *ebook = [[Ebook alloc] init];
        [ebook setNome:[item objectForKey:@"trackName"]];
        [ebook setTrackId:[item objectForKey:@"trackId"]];
        [ebook setArtista:[item objectForKey:@"artistName"]];
        [ebook setDuracao:[item objectForKey:@"trackTimeMillis"]];
        [ebook setGenero:[item objectForKey:@"primaryGenreName"]];
        [ebook setPais:[item objectForKey:@"country"]];
        [ebooks addObject:ebook];
    }
    return ebooks;
}

@end
