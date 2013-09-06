//
//  NSString+Extra.h
//  MICEN
//
//  Created by jingyu lu on 9/11/12.
//  Copyright (c) 2012 FocusTechnology Co.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Extra)
- (BOOL)emailValidate;
- (BOOL)hasChineseCharacter;
- (BOOL)allNumber;
- (BOOL)allEnglish;
- (BOOL)containsWhiteSpace;
- (NSString *)md5;
- (unsigned long)hexValue;

@end
