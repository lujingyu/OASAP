//
//  BusinessManager.m
//  OASAP
//
//  Created by jingyu lu on 9/6/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import "BusinessManager.h"

static BusinessManager *instance = nil;

@implementation BusinessManager

+ (BusinessManager *)sharedInstance {
	@synchronized(self) {
		if (instance == nil) {
			instance = [[self alloc] init];
		}
	}
	return instance;
}

@end
