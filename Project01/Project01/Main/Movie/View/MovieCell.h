//
//  MovieCell.h
//  Project01
//
//  Created by admin on 16/8/26.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
@class StarView;

@interface MovieCell : UITableViewCell{

    __weak IBOutlet UIImageView *imageView;

    __weak IBOutlet UILabel *titleLabel;

    __weak IBOutlet UILabel *averageLabel;
    
    __weak IBOutlet UILabel *yearLabel;
    
    __weak IBOutlet StarView *starView;
}

@property(nonatomic,strong)MovieModel *movie;

@end
