//
//  CinemaDetial.h
//  Project01
//
//  Created by admin on 16/9/22.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaDetial : NSObject
/*"cinemaList" : [ {
 "lowPrice" : "40.00",
 "grade" : "8.8",
 "coord" : "116.36047,40.01433",
 "distance" : null,
 "address" : "北京市海淀区学清路甲8号，圣熙8号购物中心五层西侧。",
 "name" : "嘉华国际影城",
 "id" : "1396",
 "msg" : null,
 "districtId" : "1015",
 "tel" : "010-82732228",
 "isSeatSupport" : "1",
 "isCouponSupport" : "1",
 "isImaxSupport" : "0",
 "isGroupBuySupport" : "0",
 "circleName" : "五道口"
 }, {
 "lo
 */
@property(nonatomic,copy)NSString *cinemaName;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *lowPrice;

@end
