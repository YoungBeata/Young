//
//  PosterCell.m
//  Project01
//
//  Created by admin on 16/9/8.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PosterCell.h"
#import "MovieModel.h"
#import "MovieDetailView.h"
@implementation PosterCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createView];
    }
    return self;
}
-(void)_createView{
    //创建图片视图
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.95, self.bounds.size.height * 0.95)];
    _imgView.center = self.contentView.center;
    [self.contentView addSubview:_imgView];
    
    //创建详细介绍视图
    _detaileView = [[[NSBundle mainBundle]loadNibNamed:@"MovieDetailView" owner:self options:nil]lastObject];
    _detaileView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    _detaileView.center = self.contentView.center;
    _detaileView.backgroundColor = [UIColor cyanColor];
    [self.contentView insertSubview:_detaileView belowSubview:_imgView];
}
-(void)flipView{
    UIViewAnimationOptions transtion = flip ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    NSInteger index1 = [self.contentView.subviews indexOfObject:_imgView];
    NSInteger index2 = [self.contentView.subviews indexOfObject:_detaileView];
    
    [UIView transitionWithView:self.contentView duration:.5 options:transtion animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    } completion:nil];
    
    flip = !flip;
    _isFlip = !_isFlip;
}

-(void)setMovie:(MovieModel *)movie{
    if (_movie != movie) {
        _movie = movie;
        
        //数据的填充
        NSString *urlString = [movie.images objectForKey:@"large"];
        
        //网络图片的舰载
        [_imgView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"pig"]];
        [_detaileView setMovie:_movie];
    }
}

@end
