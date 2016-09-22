//
//  MovieDetailView.m
//  Project01
//
//  Created by admin on 16/9/11.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MovieDetailView.h"
#import "StarView.h"
#import "MovieModel.h"

@implementation MovieDetailView

-(void)setMovie:(MovieModel *)movie{
    if (_movie != movie) {
        _movie = movie;
        
        NSString *mediumUrl = [self.movie.images objectForKey:@"medium"];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:mediumUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
        
        _titleLabel.text = [NSString stringWithFormat:@"中文标题:%@",_movie.title];
        _originalTitleLabel.text = [NSString stringWithFormat:@"英文标题:%@",_movie.original_title];
        _yearLabel.text = [NSString stringWithFormat:@"年份:%@",_movie.year];
        
        _starView.rating = [self.movie.average floatValue];
        _ratingLabel.text = [NSString stringWithFormat:@"%.1f",[_movie.average floatValue]];
        
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
