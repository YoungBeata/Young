//
//  PosterView.m
//  Project01
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 admin. All rights reserved.
//
#import "MovieModel.h"
#import "PosterView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#define KHeaderViewHeight 100
#define KFooterViewHeight 35

@implementation PosterView{
    UIControl *_hideView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建头部视图
        [self _createHeaderView];
        //创建中间海报视图
        [self _createPosterCollectionView];
        //创建顶部海报视图
        [self _createIndexCollectionView];
        //创建尾部视图
        [self _createFooterLabel];
        
        [_posterCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:nil];
        [_indexCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"currentItem"]) {
        
        NSNumber *newValue = [change objectForKey:@"new"];
        
        NSInteger item = [newValue integerValue];
        
        if (object == _posterCollectionView && _indexCollectionView.currentItem != item) {
            _indexCollectionView.currentItem = item;
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }else if(object == _indexCollectionView && _posterCollectionView.currentItem != item){
            _posterCollectionView.currentItem = item;
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        MovieModel *movie = self.data[item];
        _footerLabel.text = movie.title;
    }
}

-(void)_createFooterLabel{
    _footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, KScreenHeight - 49 - KFooterViewHeight, KScreenWidth, KFooterViewHeight)];
    _footerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home@2x"]];
    _footerLabel.text = @"ios90";
    _footerLabel.textAlignment = NSTextAlignmentCenter;
    _footerLabel.textColor = [UIColor colorWithRed:0 green:.5 blue:1 alpha:1];
    [self addSubview:_footerLabel];
}
-(void)_createHeaderView{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64 - KHeaderViewHeight, KScreenWidth, 130)];
    _headerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_headerView];
    
    //头视图的下边框背景设置
    UIImage *img = [UIImage imageNamed:@"indexBG_home@2x"];
    img = [img stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, KHeaderViewHeight, KScreenWidth, 30)];
    imageView.image = img;
    [_headerView addSubview:imageView];
    
    //下拉箭头的设置
    UIButton *arrowsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowsButton.frame = CGRectMake((KScreenWidth - 10) / 2, KHeaderViewHeight + 10, 15, 15);
    [arrowsButton setImage:[UIImage imageNamed:@"down_home@2x"] forState:UIControlStateNormal];
    [arrowsButton setImage:[UIImage imageNamed:@"up_home@2x"] forState:UIControlStateSelected];
    [_headerView addSubview:arrowsButton];
    arrowsButton.selected = NO;
    arrowsButton.tag = 101;
    //添加button的点击事件
    [arrowsButton addTarget:self action:@selector(arrowsAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_showHeaderView)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(_hideHeaderView)];
    pan.minimumNumberOfTouches = 2;
    pan.maximumNumberOfTouches = 3;
    [self addGestureRecognizer:pan];
    
}
-(void)_createIndexCollectionView{
    _indexCollectionView = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KHeaderViewHeight)];
    _indexCollectionView.pageWidth = 75;
    [_headerView addSubview:_indexCollectionView];
    
}
-(void)_createPosterCollectionView{
    _posterCollectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 64 + 15, KScreenWidth, self.height - 64 - KFooterViewHeight - 35 - 49)];
    _posterCollectionView.pageWidth = 280;
    _posterCollectionView.backgroundColor = [UIColor clearColor];
    [self insertSubview:_posterCollectionView belowSubview:_headerView];
}
-(void)setData:(NSMutableArray *)data{
    if (_data != data) {
        _data = data;
        [_posterCollectionView setData:data];
        [_indexCollectionView setData:data];
        if (data.count > 0) {
            MovieModel *movie = [data objectAtIndex:0];
            _footerLabel.text = movie.title;
        }
    }
}

-(void)arrowsAction:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        [self _showHeaderView];
    }else{
        [self _hideHeaderView];
    }
}

-(void)_showHeaderView{
    [UIView animateWithDuration:.3 animations:^{
        _headerView.transform = CGAffineTransformMakeTranslation(0, KHeaderViewHeight);
    }];
    
    if (_hideView == nil) {
        _hideView = [[UIControl alloc]initWithFrame:self.bounds];
        _hideView.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
        [_hideView addTarget:self action:@selector(_hideHeaderView) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:_hideView belowSubview:_headerView];
    }
    
    UIButton *arrowsButton = (UIButton *)[_headerView viewWithTag:101];
    arrowsButton.selected = YES;
    
    _hideView.hidden = NO;
};
-(void)_hideHeaderView{
    [UIView animateWithDuration:.3 animations:^{
        _headerView.transform = CGAffineTransformIdentity;
    }];
    
    UIButton *arrows = (UIButton *)[_headerView viewWithTag:101];
    arrows.selected = NO;
    
    _hideView.hidden = YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
