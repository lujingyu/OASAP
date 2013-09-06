//
//  UINavigationBar+Extra.m
//  Shelf
//
//  Created by jingyu lu on 2/4/13.
//  Copyright (c) 2013 Jingyu Lu. All rights reserved.
//

#import "UINavigationBar+Extra.h"

@implementation UINavigationBar (Extra)

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
	
    // Creating shadow path for better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    self.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
	
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
	
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
    self.clipsToBounds = NO;
	
}

@end
