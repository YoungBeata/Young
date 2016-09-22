//
//  MovieDetailView.h
//  Project01
//
//  Created by admin on 16/9/11.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class MovieModel;

@interface MovieDetailView : UIView{

    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_originalTitleLabel;
    __weak IBOutlet UILabel *_yearLabel;
    __weak IBOutlet StarView *_starView;
    __weak IBOutlet UILabel *_ratingLabel;
}

@property(nonatomic,strong)MovieModel *movie;

@end
