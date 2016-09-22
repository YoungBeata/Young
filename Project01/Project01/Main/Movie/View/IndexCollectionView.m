//
//  IndexCollectionView.m
//  Project01
//
//  Created by admin on 16/9/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCell.h"
#import "MovieModel.h"
@implementation IndexCollectionView{
    NSString *identify;
}

-(instancetype)initWithFrame:(CGRect)frame{
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    //确定滑动方向
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    //取消每个视图之间的间隔
//    flowLayout.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame ];
    if (self) {
//        //代理的实现
//        self.delegate = self;
//        self.dataSource = self;
//        
//        //取消滑动轴
//        self.showsHorizontalScrollIndicator = NO;
//        self.showsVerticalScrollIndicator = NO;
//        
//        //防滑设置
//        self.decelerationRate = UIScrollViewDecelerationRateFast;
//        
        //注册单元格
        identify = @"indexCell";
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:identify];
        
    }
    return self;
}

////单元格的偏移
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
//    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
//}
////单元格的大小设置
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
//}
//
////分页设置
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//
//    NSInteger index = (targetContentOffset->x + _pageWidth / 2) / _pageWidth;
//    targetContentOffset->x = index * _pageWidth;
//    self.currentItem = index;
//}

//选择判断至居中
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentItem != indexPath.item) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //记录当前页
        self.currentItem = indexPath.item;
    }
}


//#pragma mark - UICollectionViewDataSource
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.data.count;
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    MovieModel *movie = self.data[indexPath.item];
    cell.url = (NSString *)[movie.images objectForKey:@"medium"];
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
