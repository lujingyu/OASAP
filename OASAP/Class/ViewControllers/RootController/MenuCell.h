//
//  MenuCell.h
//  OASAP
//
//  Created by jingyu lu on 9/5/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell {
	
	UIImageView *_iconView;
	UILabel     *_titleLabel;
}

@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, retain) UILabel     *titleLabel;

- (void)setNormal:(BOOL)normal;

@end