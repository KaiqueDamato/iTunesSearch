//
//  CabecalhoTableViewCell.h
//  iTunesSearch
//
//  Created by Kaique Damato on 3/10/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CabecalhoTableViewCell : UITableViewCell <UISearchBarDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property NSArray *opcoes;
@property NSString *selecionado;

@end
