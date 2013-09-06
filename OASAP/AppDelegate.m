//
//  AppDelegate.m
//  OASAP
//
//  Created by jingyu lu on 9/5/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import "AppDelegate.h"
#import "UINavigationBar+Extra.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "SearchViewController.h"
#import "MyLovesViewController.h"
#import "NotificationsViewController.h"
#import "CartViewController.h"
#import "AboutViewController.h"
#import "AccountViewController.h"

@implementation AppDelegate
@synthesize viewDeckController = _viewDeckController;

- (void)dealloc
{
	[_nvMenuController release];
	[_nvHomeController release];
	[_nvCategoryController release];
	[_nvSearchController release];
	[_nvMyLovesController release];
	[_nvNotificationsController release];
	[_nvCartController release];
	[_nvAboutUsController release];
	[_nvAccountController release];
	
	[_viewDeckController release];
	[_window release];
    [super dealloc];
}

- (UINavigationController *)customNavigationControllerWithRootViewController:(UIViewController *)controller {
	UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
//	UIImage *image = [[UIImage imageNamed:@"navigationBar.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
//	[navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//	NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
//								[UIFont boldSystemFontOfSize:20.0f],  UITextAttributeFont,
//								ColorRGBA(37.0, 23.0, 21.0, 1.0),     UITextAttributeTextColor,
//								[NSValue valueWithCGSize:CGSizeZero], UITextAttributeTextShadowOffset,
//								nil];
//	[navigationController.navigationBar setTitleTextAttributes:attributes];
//	[navigationController.navigationBar dropShadowWithOffset:CGSizeMake(0, 1)
//													  radius:1
//													   color:[UIColor blackColor]
//													 opacity:0.5];
	
	
	return navigationController;
}

#pragma mark - IIViewDeck RootViewController

- (UIViewController *)viewControllerAtIndex:(AppController)index {
	
	switch (index) {
		case AppControllerHome: {
			if (_nvHomeController == nil) {
				HomeViewController *controller = [[HomeViewController alloc] init];
				_nvHomeController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvHomeController.delegate = self;
				controller.navigationItem.title = @"Home";
				[controller release];
			}
			return _nvHomeController;
		}
			break;
		case AppControllerCategory: {
			if (_nvCategoryController == nil) {
				CategoryViewController *controller = [[CategoryViewController alloc] init];
				_nvCategoryController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvCategoryController.delegate = self;
				controller.navigationItem.title = @"Category";
				[controller release];
			}
			return _nvHomeController;
		}
			break;
		case AppControllerSearch: {
			if (_nvSearchController == nil) {
				SearchViewController *controller = [[SearchViewController alloc] init];
				_nvSearchController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvSearchController.delegate = self;
				controller.navigationItem.title = @"Search";
				[controller release];
			}
			return _nvSearchController;
		}
			break;
		case AppControllerMyLoves: {
			if (_nvMyLovesController == nil) {
				MyLovesViewController *controller = [[MyLovesViewController alloc] init];
				_nvMyLovesController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvMyLovesController.delegate = self;
				controller.navigationItem.title = @"My Loves";
				[controller release];
			}
			return _nvMyLovesController;
		}
			break;
		case AppControllerNotifications: {
			if (_nvNotificationsController == nil) {
				NotificationsViewController *controller = [[NotificationsViewController alloc] init];
				_nvNotificationsController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvNotificationsController.delegate = self;
				controller.navigationItem.title = @"Notifications";
				[controller release];
			}
			return _nvNotificationsController;
		}
			break;
		case AppControllerCart: {
			if (_nvCartController == nil) {
				CartViewController *controller = [[CartViewController alloc] init];
				_nvCartController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvCartController.delegate = self;
				controller.navigationItem.title = @"Cart";
				[controller release];
			}
			return _nvCartController;
		}
			break;
		case AppControllerAboutUs: {
			if (_nvAboutUsController == nil) {
				AboutViewController *controller = [[AboutViewController alloc] init];
				_nvAboutUsController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvAboutUsController.delegate = self;
				controller.navigationItem.title = @"About Us";
				[controller release];
			}
			return _nvAboutUsController;
		}
			break;
		case AppControllerMyAccount: {
			if (_nvAccountController == nil) {
				AccountViewController *controller = [[AccountViewController alloc] init];
				_nvAccountController = [[self customNavigationControllerWithRootViewController:controller] retain];
				_nvAccountController.delegate = self;
				controller.navigationItem.title = @"My Account";
				[controller release];
			}
			return _nvAccountController;
		}
			break;
		case AppControllerSignOut:
			break;
		default: {
			return _nvMenuController;
		}
			break;
	}
	return nil;
}

- (IIViewDeckController *)viewDeckController {
	if (nil == _viewDeckController) {
		
		if (_nvMenuController == nil) {
			MenuViewController *controller = [[MenuViewController alloc] init];
			controller.delegate = self;
			_nvMenuController = [[self customNavigationControllerWithRootViewController:controller] retain];
			_nvMenuController.delegate = self;
			[controller release];
		}
		[_nvMenuController.navigationBar setHidden:YES];

		_viewDeckController = [[IIViewDeckController alloc] initWithCenterViewController:[self viewControllerAtIndex:AppControllerHome]
																	  leftViewController:_nvMenuController];
		_viewDeckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
		_viewDeckController.delegateMode = IIViewDeckDelegateAndSubControllers;
		_viewDeckController.delegate = self;
		_viewDeckController.panningMode = IIViewDeckDelegatePanning;
		_viewDeckController.leftSize = 35;
		_viewDeckController.rightSize = 35;
	}
	return _viewDeckController;
}

- (void)switchCenterViewControllerWith:(UIViewController *)controller {
	
	if (controller) {
		[[self viewDeckController] closeLeftViewBouncing:^(IIViewDeckController *deck) {
			self.viewDeckController.centerController = controller;
		}];
	}
}

- (void)switchCenterToIndex:(NSInteger)index {
	[[self viewDeckController] openLeftViewAnimated:YES
										 completion:^(IIViewDeckController *controller, BOOL success) {
											 if (success == YES) {
												 [self switchCenterViewControllerWith:[self viewControllerAtIndex:index]];
												 
												 MenuViewController *menu = (MenuViewController *)_viewDeckController.leftController;
												 [menu setSelectedIndex:index];
											 }
										 }];
	
}

#pragma mark - IIViewDeckControllerDelegate

- (BOOL)viewDeckController:(IIViewDeckController *)viewDeckController shouldPan:(UIPanGestureRecognizer*)panGestureRecognizer {
	
	return YES;
	
	UINavigationController *currentNavigation = (UINavigationController *)[viewDeckController centerController];
	
	NSString *className = NSStringFromClass([currentNavigation.topViewController class]);
	
	//	NBLog(@"%@", className);
	
	if ([className isEqualToString:@"SearchViewController"]) {
		viewDeckController.rightController = nil;
		return YES;
	}
	else if ([className isEqualToString:@"MagazineViewController"]) {
		return YES;
	}
	else if ([className isEqualToString:@"ShelfViewController"]) {
		viewDeckController.rightController = nil;
		return YES;
	}
	else if ([className isEqualToString:@"BookmarkViewController"]) {
		viewDeckController.rightController = nil;
		return YES;
	}
	else if ([className isEqualToString:@"SettingsViewController"]) {
		viewDeckController.rightController = nil;
		return YES;
	}
	else if ([className isEqualToString:@"QrScannerViewController"]) {
		viewDeckController.rightController = nil;
		return YES;
	}
	else if ([className isEqualToString:@"SignInViewController"]) {
		viewDeckController.rightController = nil;
		return YES;
	}
	else {
		return NO;
	}
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	
	NSString *className = NSStringFromClass([viewController class]);
	
    if ([className isEqualToString:@"PreviewViewController"] ||
		[className isEqualToString:@"MagazineDetailViewController"]) {
        [navigationController setNavigationBarHidden:YES animated:animated];
    }
	else if ([navigationController isNavigationBarHidden]) {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
}

#pragma mark - MenuViewControllerDelegate

- (void)menuController:(MenuViewController *)controller didSelectRowAtIndex:(NSIndexPath *)indexPath {
	
	[self switchCenterViewControllerWith:[self viewControllerAtIndex:indexPath.row]];
}

#pragma mark -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
	self.window.rootViewController = [self viewDeckController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
