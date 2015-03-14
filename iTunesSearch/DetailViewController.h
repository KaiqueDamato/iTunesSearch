//
//  DetailViewController.h
//  iTunesSearch
//
//  Created by Kaique Damato on 3/14/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Midia;

@interface DetailViewController : UIViewController
@property Midia *midia;
@property NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *genero;

@end
