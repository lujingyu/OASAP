//
//  NSString+array2string.h
//  Shelf
//
//  Created by zhao jia on 13-2-1.
//  Copyright (c) 2013年 Jingyu Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (array2string)

+ (NSString *)stringFromArray:(NSArray *)array withSeprator:(NSString *)seprator;

+ (NSArray *)arrayFromString:(NSString *)string withSeprator:(NSString *)seprator;
@end
