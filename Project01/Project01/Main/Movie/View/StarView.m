//
//  StarView.m
//  Project01
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"

@implementation StarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createStarView];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self _createStarView];
}
-(void)_createStarView{

    //图片
    UIImage *yellow = [UIImage imageNamed:@"yellow"];
    UIImage *gray = [UIImage imageNamed:@"gray"];
    //设置两个视图的大小
    CGFloat starWidth = yellow.size.width * 5;
    
    _grayView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, starWidth, yellow.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:gray];
    [self addSubview:_grayView];
    _yellowView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, starWidth, yellow.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellow];
    [self addSubview:_yellowView];
    //求拉伸比例
    _scal = self.frame.size.height / yellow.size.height;
    _yellowView.transform = CGAffineTransformMakeScale(_scal, _scal);
    _grayView.transform = CGAffineTransformMakeScale(_scal, _scal);
    
    //修改起始点
    CGRect f1 = _yellowView.frame;
    CGRect f2 = _grayView.frame;
    f1.origin = CGPointZero;
    f2.origin = CGPointZero;
    _yellowView.frame = f1;
    _grayView.frame = f2;
    
    self.backgroundColor = [UIColor clearColor];
    
}
-(void)setRating:(CGFloat)rating{
    _rating = rating;
    
    CGFloat t = _rating / 10.0;
    
    _yellowView.width = _scal * [UIImage imageNamed:@"yellow"].size.width * 5 * t;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
