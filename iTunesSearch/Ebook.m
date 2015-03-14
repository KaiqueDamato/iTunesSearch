//
//  Ebook.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Ebook.h"

@implementation Ebook

- (instancetype)init {
    self = [super init];
    if (self) {
        _ebooks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObject:(NSDictionary *)item {
    Ebook *ebook = [[Ebook alloc] init];
    [ebook setName:[item objectForKey:@"trackName"]];
    [ebook setTrackId:[item objectForKey:@"trackId"]];
    [ebook setArtista:[item objectForKey:@"artistName"]];
    [ebook setDuracao:[item objectForKey:@"trackTimeMillis"]];
    [ebook setGender:[item objectForKey:@"primaryGenreName"]];
    [ebook setPais:[item objectForKey:@"country"]];
    [ebook setImagemItunes:[item objectForKey:@"artworkUrl100"]];
    [_ebooks addObject:ebook];
}

@end
