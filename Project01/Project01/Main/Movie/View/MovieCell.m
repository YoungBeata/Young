//
//  MovieCell.m
//  Project01
//
//  Created by admin on 16/8/26.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MovieCell.h"
#import "MovieModel.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setMovie:(MovieModel *)movie{
    _movie = movie;
    
    NSString *small = [self.movie.images objectForKey:@"small"];
    NSURL *url = [NSURL URLWithString:small];
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
//    imageView.image = [UIImage imageNamed:@"pig"];
    titleLabel.text = self.movie.title;
    titleLabel.textColor = [UIColor whiteColor];
    averageLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    averageLabel.textColor = [UIColor whiteColor];
    yearLabel.text = [NSString stringWithFormat:@"年份:%@",self.movie.year];
    yearLabel.textColor = [UIColor whiteColor];
    starView.rating = [self.movie.average floatValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
