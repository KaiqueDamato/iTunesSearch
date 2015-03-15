//
//  CabecalhoTableViewCell.m
//  iTunesSearch
//
//  Created by Kaique Damato on 3/10/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "CabecalhoTableViewCell.h"
#import "TableViewController.h"
#import "iTunesManager.h"

@implementation CabecalhoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [_searchBar setDelegate:self];
    [_searchBar setPlaceholder:NSLocalizedString(@"Pesquisa", @"")];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    _opcoes = @[@"",@"movie",@"music",@"podcast",@"ebook"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    TableViewController *tableview = (TableViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    tableview.midias = [itunes buscarMidias:[_searchBar.text stringByReplacingOccurrencesOfString:@"-" withString:@""]];
    [tableview.tableview reloadData];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_opcoes count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _opcoes[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([_opcoes[row]  isEqual: @""]) {
        _selecionado = @"all";
    } else {
        _selecionado = _opcoes[row];
    }
}

@end
