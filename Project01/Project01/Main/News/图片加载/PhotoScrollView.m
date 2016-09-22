//
//  PhotoScrollView.m
//  Project01
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_imgView];
        
        //图片的填充方式
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        //设置放大缩小倍数
        self.minimumZoomScale = 0.5;
        self.maximumZoomScale = 3.0;
        //隐藏滑动轴
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        //设置代理
        self.delegate = self;
        //设置手势
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
        tap1.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap1];
        
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
        tap2.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap2];
        //解决冲突
        [tap1 requireGestureRecognizerToFail:tap2];
        
    }
    return self;
}
-(void)tap1:(UITapGestureRecognizer *)tap1{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"lalala" object:nil];

}
-(void)tap2:(UITapGestureRecognizer *)tap2{

    if (self.zoomScale > 1.0) {
        [self setZoomScale:1.0 animated:YES];
    }else{
        [self setZoomScale:3.0 animated:YES];
    }
}

-(void)setUrl:(NSURL *)url{
    if (_url != url) {
        _url = url;
    }
    [_imgView sd_setImageWithURL:_url];
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imgView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
