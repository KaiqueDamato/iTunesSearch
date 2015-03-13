//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "Music.h"
#import "Podcast.h"
#import "Ebook.h"

@interface TableViewController () {
    
}

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_midias count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    _headerView = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCellCabecalho" owner:self options:nil] firstObject];
    return _headerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    Filme *filme = [_midias objectAtIndex:indexPath.row];
    Music *music = [_midias objectAtIndex:indexPath.row];
    Podcast *podcast = [_midias objectAtIndex:indexPath.row];
    Ebook *ebook = [_midias objectAtIndex:indexPath.row];
    
    if (![_midias count] == 0 && [_headerView.selecionado isEqualToString:@"movie"]) {
        [celula.nome setText:filme.nome];
        [celula.tipo setText:NSLocalizedString(_headerView.selecionado, @"")];
        [celula.genero setText:filme.genero];
    } else if (![_midias count] == 0 && [_headerView.selecionado isEqualToString:@"music"]) {
        [celula.nome setText:music.nome];
        [celula.tipo setText:NSLocalizedString(_headerView.selecionado, @"")];
        [celula.genero setText:music.genero];
    } else if (![_midias count] == 0 && [_headerView.selecionado isEqualToString:@"podcast"]) {
        [celula.nome setText:podcast.nome];
        [celula.tipo setText:NSLocalizedString(_headerView.selecionado, @"")];
        [celula.genero setText:podcast.genero];
    } else if (![_midias count] == 0 && [_headerView.selecionado isEqualToString:@"ebook"]) {
        [celula.nome setText:ebook.nome];
        [celula.tipo setText:NSLocalizedString(_headerView.selecionado, @"")];
        [celula.genero setText:ebook.artista];
    }
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 190;
}


@end
