//
//  PhotoScrollView.h
//  Project01
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>{
    UIImageView *_imgView;
}
@property(nonatomic,strong)NSURL *url;

@end
