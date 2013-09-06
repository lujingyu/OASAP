//
//  UINavigationBar+Extra.h
//  Shelf
//
//  Created by jingyu lu on 2/4/13.
//  Copyright (c) 2013 Jingyu Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UINavigationBar (Extra)

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity;

@end
