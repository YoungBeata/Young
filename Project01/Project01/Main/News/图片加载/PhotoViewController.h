//
//  PhotoViewController.h
//  Project01
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController{
    BOOL _isHiden;
}
@property(nonatomic,strong)NSArray *urls;
@property(nonatomic,strong)NSIndexPath *indexPath;
@end
