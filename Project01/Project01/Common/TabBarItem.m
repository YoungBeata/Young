//
//  TabBarItem.m
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title{

    self = [super initWithFrame:frame];
    if (self != nil) {
        //设置图片视图的大小
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 20)/2, 8,20, 20)];
        //在视图上添加图片
        imageView.image = [UIImage imageNamed:imageName];
        //设置视图填入图片不变
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        //视图添加到item上
        [self addSubview:imageView];
        
        //设置title
        CGFloat maxY = CGRectGetMaxY(imageView.frame);
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, maxY, frame.size.width, 18)];
        //设置title的相关设置
        titleLabel.text = title;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:10];
        //将title添加到item上
        [self addSubview:titleLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
