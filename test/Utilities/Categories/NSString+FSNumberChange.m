//
//  NSString+FSNumberChange.m
//  JTXX
//
//  Created by Mac on 16/3/16.
//  Copyright © 2016年 nanjingfeisheng. All rights reserved.
//

#import "NSString+FSNumberChange.h"

@implementation NSString (FSNumberChange)
- (NSString *)toFormatNumberString
{
    @try
    {
        if (self.length < 3)
        {
            return self;
        }
        NSString *numStr = self;
        NSArray *array = [numStr componentsSeparatedByString:@"."];
        NSString *numInt = [array objectAtIndex:0];
        if (numInt.length <= 3)
        {
            return self;
        }
        NSString *suffixStr = @"";
        if ([array count] > 1)
        {
            suffixStr = [NSString stringWithFormat:@".%@",[array objectAtIndex:1]];
        }
        
        NSMutableArray *numArr = [[NSMutableArray alloc] init];
        while (numInt.length > 3)
        {
            NSString *temp = [numInt substringFromIndex:numInt.length - 3];
            numInt = [numInt substringToIndex:numInt.length - 3];
            [numArr addObject:[NSString stringWithFormat:@",%@",temp]];//得到的倒序的数据
        }
        NSInteger count = [numArr count];
        for (int i = 0; i < count; i++)
        {
            numInt = [numInt stringByAppendingFormat:@"%@",[numArr objectAtIndex:(count -1 -i)]];
        }
        numStr = [NSString stringWithFormat:@"%@%@",numInt,suffixStr];
        return numStr;
    }
    @catch (NSException *exception)
    {
        return self;
    }
    @finally
    {}
    
}
@end
