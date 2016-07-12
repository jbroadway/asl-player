#import <Cordova/CDVPlugin.h>
#import <AVFoundation/AVFoundation.h>

@class ASLPlayerViewController;

/**
 * Interface of the ASLPlayer Cordova plugin.
 */
@interface ASLPlayer : CDVPlugin {
    IBOutlet ASLPlayerViewController *controller;
}

@property (nonatomic, retain) IBOutlet ASLPlayerViewController *controller;

- (void)create:(CDVInvokedUrlCommand*)command;
- (void)play:(CDVInvokedUrlCommand*)command;
- (void)pause:(CDVInvokedUrlCommand*)command;
- (void)seek:(CDVInvokedUrlCommand*)command;
- (void)hide:(CDVInvokedUrlCommand*)command;

@end
