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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)botaoEnviar:(id)sender {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    
    TableViewController *tableview = (TableViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    tableview.midias = [itunes buscarMidias:_termoTextField.text];
    [tableview.tableview reloadData];
}

@end
