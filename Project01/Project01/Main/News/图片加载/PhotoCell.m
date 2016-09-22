//
//  PhotoCell.m
//  Project01
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoScrollView.h"

@implementation PhotoCell
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        _srollView = [[PhotoScrollView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_srollView];
    }
    return self;

}
-(void)setUrl:(NSString *)url{
    if (_url != url) {
        _url = url;
        
        _srollView.url = [NSURL URLWithString:_url];
    }
}




@end
