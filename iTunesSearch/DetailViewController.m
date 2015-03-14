//
//  DetailViewController.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/14/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "DetailViewController.h"
#import "Midia.h"
#import "Filme.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _midia = [Midia sharedInstance];
    NSArray *items = _midia.dictionary[_midia.keys[[_indexPath section]]];
    [self setTitle:_midia.keys[_indexPath.section]];
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[[items objectAtIndex:_indexPath.row] imagemItunes]]];
    _imagem.image = [UIImage imageWithData:imageData];
    
    _nome.text = [[_midia.dictionary[_midia.keys[_indexPath.section]] objectAtIndex:_indexPath.row] name];
    _genero.text = [[_midia.dictionary[_midia.keys[_indexPath.section]] objectAtIndex:_indexPath.row] gender];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
