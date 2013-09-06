//
//  MenuViewController.m
//  OASAP
//
//  Created by jingyu lu on 9/5/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)dealloc {
	[_datasource release];
	[_tableView release];
	[super dealloc];
}

- (void)initDatasource {
	if (_datasource == nil) {
		_datasource = [[NSMutableArray alloc] initWithCapacity:0];
	}
	else {
		[_datasource removeAllObjects];
	}
	[_datasource removeAllObjects];
	[_datasource addObject:@"Home"];
	[_datasource addObject:@"Category"];
	[_datasource addObject:@"Search"];
	[_datasource addObject:@"My Loves"];
	[_datasource addObject:@"Notifications"];
	[_datasource addObject:@"Cart"];
	[_datasource addObject:@"About Us"];
	[_datasource addObject:@"My Account"];
	[_datasource addObject:@"Sign Out"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	// 默认选中第0行
	_selectedIndex = 0;
	
	[self initDatasource];
	
	CGRect frame = CGRectZero;
	if (iPhone5) {
		frame = CGRectMake(0, 0, 320, 548);
	}
	else {
		frame = CGRectMake(0, 0, 320, 460);
	}
	_tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	//	_tableView.backgroundColor = ColorRGBA(51.0, 51.0, 51.0, 1.0);
	_tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_background.png"]];
	[self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshLoginStatus
{
    [_tableView reloadData];
}

- (void)setSelectedIndex:(NSInteger)index {
	_selectedIndex = index;
	[_tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *identifier = @"MenuCell";
	MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (nil == cell) {
		cell = [[[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
	}
	NSString *title = [_datasource objectAtIndex:indexPath.row];
	cell.titleLabel.text = title;

	if(indexPath.row == _selectedIndex) {
		[cell setNormal:NO];
	}
	else {
		[cell setNormal:YES];
	}
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	if (self.delegate && [self.delegate respondsToSelector:@selector(menuController:didSelectRowAtIndex:)]) {
		[self.delegate menuController:self didSelectRowAtIndex:indexPath];
	}
}

@end
