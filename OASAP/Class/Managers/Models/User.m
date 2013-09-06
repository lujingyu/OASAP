//
//  User.m
//  OASAP
//
//  Created by jingyu lu on 9/6/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import "User.h"

@implementation User

- (void)dealloc {
	self.userID = nil;
	self.userName = nil;
	[super dealloc];
}

- (id)initWithInfo:(NSDictionary *)info {
	if (self = [super init]) {
		
	}
	return self;
}

@end
