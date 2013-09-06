//
//  NSString+array2string.m
//  Shelf
//
//  Created by zhao jia on 13-2-1.
//  Copyright (c) 2013年 Jingyu Lu. All rights reserved.
//

#import "NSString+array2string.h"
#import "NSString+URLEncoding.h"

@implementation NSString (array2string)

+ (NSArray *)arrayFromString:(NSString *)string withSeprator:(NSString *)seprator
{
    NSArray *array = [[NSArray alloc]initWithArray:[string componentsSeparatedByString:seprator]];
    NSMutableArray *result = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL *stop) {
        [result addObject:[obj decodedURLString]];
    }];
    [array release];
    return result;
}

+ (NSString *)stringFromArray:(NSArray *)array withSeprator:(NSString *)seprator
{
    NSMutableString *result = [[NSMutableString alloc]init];
    [array enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            return ;
        }
        [result appendString:[obj encodedURLString]];
        [result appendString:seprator];
    }];
    [result deleteCharactersInRange:NSRangeFromString([NSString stringWithFormat:@"%d,%d",[result length]-[seprator length], [seprator length]])];
    
    return [result autorelease];
}

@end
