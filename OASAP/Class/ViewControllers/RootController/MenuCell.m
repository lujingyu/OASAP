//
//  MenuCell.m
//  OASAP
//
//  Created by jingyu lu on 9/5/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell
@synthesize iconView = _iconView;
@synthesize titleLabel = _titleLabel;

- (void)dealloc {
	[_iconView release];
	[_titleLabel release];
	[super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor grayColor];
		
		UIImageView *normalBG = [[UIImageView alloc] initWithFrame:self.bounds];
		normalBG.image = [[UIImage imageNamed:@"menu_cell_normal.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
		self.backgroundView = normalBG;
		[normalBG release];
		
		UIImageView *highlightedBG = [[UIImageView alloc] initWithFrame:self.bounds];
		highlightedBG.image = [[UIImage imageNamed:@"menu_cell_highlighted.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
		self.selectedBackgroundView = highlightedBG;
		[highlightedBG release];
		
		_iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
		[self.contentView addSubview:_iconView];
		
		_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_titleLabel.numberOfLines = 1;
		_titleLabel.textColor = [UIColor whiteColor];
		_titleLabel.highlightedTextColor = ColorRGBA(252.0, 235.0, 75.0, 1.0);
		_titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
		_titleLabel.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	_iconView.frame = CGRectMake(12, 12, 20, 20);
	_titleLabel.frame = CGRectMake(44, 0, 200, 44);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}

- (void)setNormal:(BOOL)normal {
	if (normal == YES) {
		UIImageView *normalBG = [[UIImageView alloc] initWithFrame:self.bounds];
		normalBG.image = [[UIImage imageNamed:@"menu_cell_normal.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
		self.backgroundView = normalBG;
		[normalBG release];
	}
	else {
		UIImageView *highlightedBG = [[UIImageView alloc] initWithFrame:self.bounds];
		highlightedBG.image = [[UIImage imageNamed:@"menu_cell_highlighted.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
		self.backgroundView = highlightedBG;
		[highlightedBG release];
	}
}

@end
