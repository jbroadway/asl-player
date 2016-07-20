#import "ASLPlayerViewController.h"

static void *ASLPlayerPlaybackViewControllerStatusObservationContext = &ASLPlayerPlaybackViewControllerStatusObservationContext;

/**
 * Implementation of the ASLPlayer view controller. Provides controls to pass
 * down to AVPlayer.
 */
@implementation ASLPlayerViewController

/**
 * The AVPlayer player and ASLPlayerPlaybackView view objects.
 */
@synthesize player, playerLayer;

/**
 * Creates a new AVPlayer with the given file to play.
 */
- (void)setFile:(NSString *)file {
	NSLog(@"ASLPlayerViewController.setFile(%@)", file);

	// Build URL to file
	NSString *filePath = [NSString stringWithFormat:@"www/%@", file];
	NSString *fullPath = [[NSBundle mainBundle] pathForResource:filePath ofType:@"mp4"];
	NSURL *url = [NSURL fileURLWithPath: fullPath];

	// Initialize AVPlayer
	AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL: url options: nil];
	AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithAsset: avAsset];

	self.player = [[AVPlayer alloc] initWithPlayerItem: playerItem];

	self.player.actionAtItemEnd = AVPlayerActionAtItemEndPause;
	self.player.muted = YES;
	
	// Initialize player layer
	self.playerLayer = [AVPlayerLayer playerLayerWithPlayer: self.player];
	self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
	self.playerLayer.frame = CGRectMake(0, 0, 220, 235);
	[self.view.layer addSublayer: self.playerLayer];
	
	self.view.userInteractionEnabled = NO;
	
	// Observe changes to AVPlayer status
	[self.player addObserver:self forKeyPath:@"status" options:0 context:ASLPlayerPlaybackViewControllerStatusObservationContext];
}

/**
 * Observes changes to the AVPlayer status.
 */
- (void)observeValueForKeyPath:(NSString *)path ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if (player.status == AVPlayerStatusReadyToPlay) {
		NSLog(@"- Observed status change");

		//self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
	}
}

/**
 * Plays the currently loaded AVPlayer video.
 */
- (void)play {
	NSLog(@"ASLPlayerViewController.play()");

	[self.player play];
}

/**
 * Pauses the currently loaded AVPlayer video.
 */
- (void)pause {
	NSLog(@"ASLPlayerViewController.play()");
	
	[self.player pause];
}

/**
 * Seeks to the specified seek time of the currently loaded AVPlayer video.
 */
- (void)seekToTime:(CMTime)time {
	NSLog(@"ASLPlayerViewController.seekToTime(%f)", CMTimeGetSeconds(time));
	
	[self.player seekToTime: time];
}

/**
 * Remove the player from the scene.
 */
- (void)remove {
	NSLog(@"ASLPlayerViewController.remove()");
	
	self.player = nil;
	
	[self.playerLayer removeFromSuperlayer];
}

@end
