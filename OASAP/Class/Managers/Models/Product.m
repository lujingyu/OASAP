//
//  Product.m
//  OASAP
//
//  Created by jingyu lu on 9/6/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import "Product.h"

@implementation Product

- (void)dealloc {
	self.productID = nil;
	self.productName = nil;
	self.imageURL = nil;
	self.price = nil;
	[super dealloc];
}

- (id)initWithInfo:(NSDictionary *)info {
	if (self = [super init]) {
		
	}
	return self;
}

@end
