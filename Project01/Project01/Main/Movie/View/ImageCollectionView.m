//
//  ImageCollectionView.m
//  Project01
//
//  Created by admin on 16/9/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ImageCollectionView.h"

@implementation ImageCollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        self.delegate = self;
        self.dataSource = self;
        
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    return self;
}
//左右偏移量
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
}
//分页设置
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSInteger index = (targetContentOffset->x + _pageWidth / 2) / _pageWidth;
    targetContentOffset->x = index * _pageWidth;
    
    self.currentItem = index;
}
////居中设置
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.currentItem != indexPath.item) {
//        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//        self.currentItem = indexPath.item;
//    }
//
//}

//单元格尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
