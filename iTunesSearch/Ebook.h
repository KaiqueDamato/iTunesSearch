//
//  Ebook.h
//  iTunesSearch
//
//  Created by Kaique Damato on 3/13/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ebook : NSObject

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *trackId;
@property (nonatomic, strong) NSString *artista;
@property (nonatomic, strong) NSString *duracao;
@property (nonatomic, strong) NSString *genero;
@property (nonatomic, strong) NSString *pais;

- (NSMutableArray *)busca:(NSDictionary *)dicionario;

@end
