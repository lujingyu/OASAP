//
//  NSString+Extra.m
//  MICEN
//
//  Created by jingyu lu on 9/11/12.
//  Copyright (c) 2012 FocusTechnology Co.,LTD. All rights reserved.
//

#import "NSString+Extra.h"
#import "RegexKitLite.h"

#include <stdio.h>
#include <string.h>

@implementation NSString (Extra)

- (BOOL)emailValidate {
    if ([self rangeOfString:@" "].location != NSNotFound) {
        return NO;
    }
    return [self isMatchedByRegex:@"^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$"];
}

- (BOOL)hasChineseCharacter {
    return [self isMatchedByRegex:@"[\u4e00-\u9fa5\u30a1-\u30f6\u3041-\u3093\uFF00-\uFFFF]"];
}

- (BOOL)allNumber
{
    return ![self isMatchedByRegex:@"[^0-9]"];
}

- (BOOL)allEnglish
{
    return [self isMatchedByRegex:@"^[a-zA-Z0-9_\\-]+$"];
}

- (BOOL)containsWhiteSpace {
	if ([self rangeOfString:@" "].location != NSNotFound) {
		return YES;
	}
	else {
		return NO;
	}
}

- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];
}

- (unsigned long)hexValue {
	if ([self hasPrefix:@"0x"]) {
		self = [self substringFromIndex:2];
	}
	const char * str = [[self uppercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
	unsigned long var=0;
	unsigned long t;
//	int len = strlen(str);
	
	if (var > 8) //最长8位
		return -1;
//	strupr(str);//统一大写
	for (; *str; str++)
	{
		if (*str>='A' && *str <='F')
			t = *str-55; //a-f之间的ascii与对应数值相差55如'A'为65,65-55即为A
		else
			t = *str-48;
		var<<=4;
		var|=t;
	}
	return var;
}

@end

