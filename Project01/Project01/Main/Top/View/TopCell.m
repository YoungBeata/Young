//
//  TopCell.m
//  Project01
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell

-(void)setMovie:(MovieModel *)movie{
    if (movie != nil) {
        _movie = movie;
        
        NSString *urlString = [self.movie.images objectForKey:@"medium"];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        
        _titleLabel.text = self.movie.title;
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
        
        _starView.rating = [self.movie.average floatValue];
        _ratingLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    }
}

@end
