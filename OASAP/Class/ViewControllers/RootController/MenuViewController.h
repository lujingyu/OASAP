//
//  MenuViewController.h
//  OASAP
//
//  Created by jingyu lu on 9/5/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import "RootViewController.h"

@class MenuViewController;
@protocol MenuViewControllerDelegate <NSObject>
- (void)menuController:(MenuViewController *)controller didSelectRowAtIndex:(NSIndexPath *)indexPath;
@end

@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
	
	UITableView    *_tableView;
	NSMutableArray *_datasource;
	NSInteger       _selectedIndex;
}
@property (nonatomic, assign) id<MenuViewControllerDelegate> delegate;

- (void)refreshLoginStatus;

- (void)setSelectedIndex:(NSInteger)index;

@end
