//
//  WTFXcodePlugin.m
//  WTFXcode
//
//  Created by Josh Abernathy on 9/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WTFXcodePlugin.h"
#import "WTFXcodePluginController.h"

static WTFXcodePluginController *pluginController;


@implementation WTFXcodePlugin


#pragma mark Xcode

+ (void) pluginDidLoad:(NSBundle *)plugin {
	NSLog(@"Hey, we're in Xcode!");
	
	pluginController = [[WTFXcodePluginController alloc] init];
}

@end
