//
//  Product.h
//  OASAP
//
//  Created by jingyu lu on 9/6/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, retain) NSString *productID;
@property (nonatomic, retain) NSString *productName;
@property (nonatomic, retain) NSString *imageURL;
@property (nonatomic, retain) NSString *price;

- (id)initWithInfo:(NSDictionary *)info;

@end
