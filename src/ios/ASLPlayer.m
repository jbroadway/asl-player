#import "ASLPlayer.h"
#import "ASLPlayerViewController.h"
#import <Cordova/CDVPlugin.h>

/**
 * Implements the ASLPlayer Cordova plugin.
 */
@implementation ASLPlayer

/**
 * View controller property, an instance of ASLPlayerViewController.
 */
@synthesize controller;

/**
 * Handles ASLPlayer.create(file) from Javascript.
 */
- (void)create:(CDVInvokedUrlCommand*)command {
	CDVPluginResult* pluginResult = nil;
	NSString* file = [command.arguments objectAtIndex:0];
	
	NSLog(@"ASLPlayer.create(%@)", file);

	self.controller = [[ASLPlayerViewController alloc] init];

	[self.viewController addChildViewController:controller];
	
	CGFloat bottom = CGRectGetMaxY(self.viewController.view.frame);
	CGFloat right = CGRectGetMaxX(self.viewController.view.frame);
	CGRect frame = CGRectMake(right - 235, bottom - 250, 220, 235); // added 15px border
	self.controller.view.frame = frame;
	
	[self.controller.view setHidden:NO];
	[self.viewController.view addSubview:controller.view];
	[self.controller didMoveToParentViewController:self.viewController];
	
	[self.controller setFile:file];
	
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:file];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/**
 * Handles ASLPlayer.play() from Javascript.
 */
- (void)play:(CDVInvokedUrlCommand*)command {
	CDVPluginResult* pluginResult = nil;
	
	NSLog(@"ASLPlayer.play()");
	
	[self.controller play];
	
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/**
 * Handles ASLPlayer.pause() from Javascript.
 */
- (void)pause:(CDVInvokedUrlCommand*)command {
	CDVPluginResult* pluginResult = nil;
	
	NSLog(@"ASLPlayer.pause()");
	
	[self.controller pause];
	
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/**
 * Handles ASLPlayer.seek(seconds) from Javascript.
 */
- (void)seek:(CDVInvokedUrlCommand*)command {
	CDVPluginResult* pluginResult = nil;
	float seconds = [[command.arguments objectAtIndex:0] floatValue];
	CMTime time = CMTimeMakeWithSeconds(seconds, 60000);
	
	NSLog(@"ASLPlayer.seek(%f)", seconds);
	
	[self.controller seekToTime: time];
	
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/**
 * Handles ASLPlayer.hide() from Javascript.
 */
- (void)hide:(CDVInvokedUrlCommand*)command {
	CDVPluginResult* pluginResult = nil;
	
	NSLog(@"ASLPlayer.hide()");
	
	if (self.controller != nil) {
		[self.controller pause];
	}
	
	[self.controller remove];
	[self.controller.view setHidden:YES];
	
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
