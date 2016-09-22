
//
//  PosterCollectionView.m
//  Project01
//
//  Created by admin on 16/9/8.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"

@implementation PosterCollectionView{
    NSString *identify;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    flowLayout.minimumLineSpacing = 0;
    if (self = [super initWithFrame:frame ]) {
//        //代理的设置
//        self.delegate = self;
//        self.dataSource = self;
//        
//        //滚动条的设置
//        self.showsHorizontalScrollIndicator = NO;
//        self.showsVerticalScrollIndicator = NO;
//        
//        self.decelerationRate = UIScrollViewDecelerationRateFast;
//        
        identify = @"posterCell";
        //注册单元格
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:identify];
    }
    return self;
}

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    
//    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
//    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
//
//}
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    int index = (targetContentOffset->x + _pageWidth / 2) / _pageWidth;
//    if (self.currentItem == index && index < self.data.count - 1) {
//        if (velocity.x > 0.5) {
//            index++;
//        }else if(velocity.x < -0.5 && index > 0){
//            index--;
//        }
//    }
//    
//    targetContentOffset->x = index * _pageWidth;
//    self.currentItem = index;
//}
//
#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentItem == indexPath.item) {
        PosterCell *pCell = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [pCell flipView];
    }else{
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentItem = indexPath.item;
    }
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
//}

#pragma mark - UICollectionViewDdataSource
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.data.count;
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.movie = self.data[indexPath.item];
    
    return cell;
}

//在下一个单元格出现前将翻转的单元格翻转回来
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([(PosterCell *)cell isFlip] == 1) {
        [(PosterCell *)cell flipView];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
