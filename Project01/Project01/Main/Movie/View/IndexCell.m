//
//  IndexCell.m
//  Project01
//
//  Created by admin on 16/9/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "IndexCell.h"
@implementation IndexCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.95, self.bounds.size.height * 0.95)];
        _imgView.center = self.contentView.center;
        [self.contentView addSubview:_imgView];
    }
    return self;
}
-(void)setUrl:(NSString *)url{
    if (_url != url) {
        _url = url;
     
        [_imgView sd_setImageWithURL:[NSURL URLWithString:_url] placeholderImage:[UIImage imageNamed:@"pig"]];
    }
}

@end
