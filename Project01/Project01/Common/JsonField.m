//
//  JsonField.m
//  Project01
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "JsonField.h"

@implementation JsonField
+(instancetype)jsonField:(NSString *)fieldName{
    NSString *fieldPath = [[NSBundle mainBundle]pathForResource:fieldName ofType:NULL];
    
    NSData *data = [NSData dataWithContentsOfFile:fieldPath];
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return json;
}
@end
