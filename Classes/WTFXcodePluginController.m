//
//  WTFXcodePluginController.m
//  WTFXcode
//
//  Created by Josh Abernathy on 9/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WTFXcodePluginController.h"

static NSString * const WTFXcodePluginControllerMenuTitle = @"Import External Source…";

@interface WTFXcodePluginController ()
- (void)frameChanged:(NSNotification *)notification;
- (void)insertOurselvesIntoTheMenu;
- (void)importExternalSource:(id)sender;
@end


@implementation WTFXcodePluginController

- (id)init {
	self = [super init];
	if(self == nil) return nil;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(frameChanged:) name:NSViewFrameDidChangeNotification object:nil];
	
	return self;
}

- (void)frameChanged:(NSNotification *)notification {
	id view = [notification object];
	
	if([view isMemberOfClass:NSClassFromString(@"DVTSourceTextView")]) {
		[self insertOurselvesIntoTheMenu];
	}
}

- (void)insertOurselvesIntoTheMenu {
	// TODO: this might be localized by Xcode...
	static NSString * const editorMenuTitle = @"Editor";
	
	NSMenu *editorMenu = [[[NSApp mainMenu] itemAtIndex:[[NSApp mainMenu] indexOfItemWithTitle:editorMenuTitle]] submenu];
	if(editorMenu == nil) {
		NSLog(@"We couldn't find the Editor menu. We'll try again soon.");
		[self performSelector:_cmd withObject:nil afterDelay:0.5f];
		return;
	}
	
	if([editorMenu itemWithTitle:WTFXcodePluginControllerMenuTitle] == nil) {
		NSMenuItem *newItem = [[NSMenuItem alloc] initWithTitle:WTFXcodePluginControllerMenuTitle action:@selector(importExternalSource:) keyEquivalent:@""];
		[newItem setTarget:self];
		[newItem setEnabled:YES];
		
		[editorMenu insertItem:newItem atIndex:[editorMenu numberOfItems]];
	}
	
	NSLog(@"Inserted at %lu", (unsigned long) [editorMenu indexOfItemWithTitle:WTFXcodePluginControllerMenuTitle]);
}

- (void)importExternalSource:(id)sender {
	[[NSAlert alertWithMessageText:@"I'm in ur Xcodez!" defaultButton:@"Hot damn!" alternateButton:@"WTF Mate" otherButton:nil informativeTextWithFormat:@""] runModal];
}

@end
