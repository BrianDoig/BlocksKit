//
//  DDAppDelegate.m
//  DynamicDelegate
//
//  Created by Alexsander Akers on 11/26/11.
//  Copyright (c) 2011 Pandamonia LLC. All rights reserved.
//

#import "A2DynamicDelegate.h"
#import "DDAppDelegate.h"

@implementation DDAppDelegate

@synthesize window = _window;

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
	// Override point for customization after application launch.
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"A2DynamicDelegate" message: @"This alert view has a dynamic delegate! \U0001f604" delegate: nil cancelButtonTitle: @"Meh\u2026" otherButtonTitles: @"OH HUZZAH!", nil];
	
	A2DynamicDelegate *delegate = [alertView dynamicDelegate];
	[delegate implementSelector: @selector(alertView:willDismissWithButtonIndex:) withBlock: ^(A2DynamicDelegate *_delegate, UIAlertView *alertView, NSInteger buttonIndex) {
		NSLog(@"You pushed button #%d", buttonIndex);
	}];

	alertView.delegate = delegate;
	
	[alertView show];
	
	return YES;
}

@end