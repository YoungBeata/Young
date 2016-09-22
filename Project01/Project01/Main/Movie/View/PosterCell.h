//
//  PosterCell.h
//  Project01
//
//  Created by admin on 16/9/8.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
@class MovieDetailView;
@interface PosterCell : UICollectionViewCell{
    UIImageView *_imgView;
    MovieDetailView *_detaileView;
    BOOL flip;
}

@property(nonatomic,strong)MovieModel *movie;
@property(nonatomic,assign)BOOL isFlip;

-(void)flipView;
@end
