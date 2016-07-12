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
	CGRect frame = CGRectMake(right - 220, bottom - 235, 220, 235);
	self.controller.view.frame = frame;

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
	
	[self.viewController.view setHidden:NO];
	
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
    NSDate* time = [command.arguments objectAtIndex:0];
    
    NSLog(@"ASLPlayer.seek(%@)", time);
    
    [self.controller seekToDate:time];
        
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
	
	[self.viewController.view setHidden:YES];
	
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
