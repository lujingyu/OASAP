//
//  User.h
//  OASAP
//
//  Created by jingyu lu on 9/6/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSString *userName;

- (id)initWithInfo:(NSDictionary *)info;

@end
