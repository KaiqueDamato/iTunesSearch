//
//  iTunesManager.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "Music.h"
#import "Podcast.h"
#import "Ebook.h"
#import "Midia.h"

@implementation iTunesManager

static iTunesManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}


- (void)buscarMidias:(NSString *)termo {
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=all&limit=200", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
    }
    
    Filme *filme = [[Filme alloc] init];
    Music *musica = [[Music alloc] init];
    Podcast *podcast = [[Podcast alloc] init];
    Ebook *ebook = [[Ebook alloc] init];

    NSArray *resultados = [resultado objectForKey:@"results"];
    
    for (NSDictionary *item in resultados) {
        if ([[item objectForKey:@"kind"] isEqualToString:@"feature-movie"]) {
            [filme addObject:item];
        } else if ([[item objectForKey:@"kind"] isEqualToString:@"song"]) {
            [musica addObject:item];
        } else if ([[item objectForKey:@"kind"] isEqualToString:@"podcast"]) {
            [podcast addObject:item];
        } else if ([[item objectForKey:@"kind"] isEqualToString:@"ebook"]) {
            [ebook addObject:item];
        }
    }
    _midia = [Midia sharedInstance];
    _midia.dictionary = [[NSDictionary alloc] initWithObjects:@[filme.filmes, musica.musicas, podcast.podcasts, ebook.ebooks] forKeys:@[@"filme", @"musica", @"podcast", @"ebook"]];
}




#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[iTunesManager alloc] init];
}

- (id)mutableCopy
{
    return [[iTunesManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
