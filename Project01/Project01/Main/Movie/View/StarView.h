//
//  StarView.h
//  Project01
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView{
    UIImageView *_yellowView;
    UIImageView *_grayView;
    CGFloat _scal;
}
@property(nonatomic,assign)CGFloat rating;
@end
