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
#import "Midia.h"
#import "DetailViewController.h"

@interface TableViewController () {
    UISearchBar *s;
    iTunesManager *itunes;
    NSUserDefaults *data;
}

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *buttonBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(pesquisa)];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];

    s = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    [s setDelegate: self];
    self.navigationItem.titleView = s;
    self.navigationItem.rightBarButtonItem = buttonBarItem;
    s.placeholder = NSLocalizedString(@"Pesquisar", nil);
    _midia = [Midia sharedInstance];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchUpView)];
    [self.headerView addGestureRecognizer:tap];
}

- (void)pesquisa {
    if ([_midia.dictionary count] != 0) {
        itunes = [iTunesManager sharedInstance];
        NSString *pesquisa = [[data objectForKey:@"pesquisa"] description];
        [itunes buscarMidias:[pesquisa stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
        [self.tableview reloadData];
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    itunes = [iTunesManager sharedInstance];
    if ([_midia.dictionary count] == 0) {
        data = [NSUserDefaults standardUserDefaults];
        [data setObject:searchBar.text forKey:@"pesquisa"];
        [data synchronize];
    }
    [itunes buscarMidias:[searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
    [self.tableview reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([_midia.dictionary count] == 0) {
        return 0;
    }
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 30)];
    headerView.text = _midia.keys[section];
    headerView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    return headerView;
}

- (void)didTouchUpView {
    if ([s isFirstResponder]) {
        [s resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([s isFirstResponder]) {
        [s resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([s isFirstResponder]) {
        [s resignFirstResponder];
        return;
    }
    
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    detailView.indexPath = indexPath;
    [self.navigationController pushViewController:detailView animated:YES];
    
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_midia.keys count];
}

- (void)viewDidAppear:(BOOL)animated {
    [_tableview reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [_midia.dictionary[@"filme"] count];
    } else if (section == 1) {
        return [_midia.dictionary[@"musica"] count];
    } else if (section == 2) {
        return [_midia.dictionary[@"podcast"] count];
    } else {
        return [_midia.dictionary[@"ebook"] count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    NSArray *items = _midia.dictionary[_midia.keys[[indexPath section]]];
    
    celula.nome.text = [[items objectAtIndex:indexPath.row] name];
    [celula.tipo setText:_midia.keys[indexPath.section]];
    [celula.genero setText:[items[indexPath.row] gender]];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[[items objectAtIndex:indexPath.row] imagemItunes]]];
    celula.imagemCelula.image = [UIImage imageWithData:imageData];
    celula.imagemCelulaIcon.image = [UIImage imageNamed:_midia.iconImages[indexPath.section]];
    
    return celula;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

@end
