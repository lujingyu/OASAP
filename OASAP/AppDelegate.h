//
//  AppDelegate.h
//  OASAP
//
//  Created by jingyu lu on 9/5/13.
//  Copyright (c) 2013 jingyu lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "MenuViewController.h"

typedef enum {
	AppControllerHome,
	AppControllerCategory,
	AppControllerSearch,
	AppControllerMyLoves,
	AppControllerNotifications,
	AppControllerCart,
	AppControllerAboutUs,
	AppControllerMyAccount,
	AppControllerSignOut
} AppController;

@interface AppDelegate : UIResponder
<
UIApplicationDelegate,
UINavigationControllerDelegate,
IIViewDeckControllerDelegate,
MenuViewControllerDelegate
>
{
	UINavigationController *_nvMenuController;
	
	UINavigationController *_nvHomeController;
	UINavigationController *_nvCategoryController;
	UINavigationController *_nvSearchController;
	UINavigationController *_nvMyLovesController;
	UINavigationController *_nvNotificationsController;
	UINavigationController *_nvCartController;
	UINavigationController *_nvAboutUsController;
	UINavigationController *_nvAccountController;
}

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) IIViewDeckController *viewDeckController;

@end
