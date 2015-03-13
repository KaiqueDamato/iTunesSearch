//
//  Filme.h
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filme : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *artista;
@property (nonatomic, strong) NSString *duracao;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *pais;
@property NSMutableArray *filmes;

- (instancetype)init;
- (void)addObject:(NSDictionary *)item;
@end
