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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    
    TableViewController *tableview = (TableViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    tableview.midias = [itunes buscarMidias:[_searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@""]];
    [tableview.tableview reloadData];
}

@end
