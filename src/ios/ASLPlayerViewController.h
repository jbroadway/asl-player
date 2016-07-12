#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class ASLPlayerPlaybackView;
@class AVPlayer;

/**
 * Interface of the ASLPlayer view controller. Provides controls to pass
 * down to AVPlayer.
 */
@interface ASLPlayerViewController : UIViewController {
	AVPlayer* player;
	AVPlayerLayer* playerLayer;
}

@property (readwrite, retain) AVPlayer* player;
@property (readwrite, retain) AVPlayerLayer* playerLayer;

- (void)observeValueForKeyPath:(NSString *) path ofObject:(id)object change:(NSDictionary*)change context:(void*)context;

- (void)setFile:(NSString*)file;
- (void)play;
- (void)pause;
- (void)seekToTime:(CMTime)date;

@end
