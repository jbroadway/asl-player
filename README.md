# ASL Plugin for Apache Cordova

This plugin places a secondary video player in the bottom right corner of your
app that will play sign language (ASL) videos alongside your main video content,
for accessibility.

The plugin works around the iOS limitation of only playing one video at a time,
by using the AVFoundation framework to do so.

Browser platform support is not implemented, but should silently fail. If you
would like to add support for this or other additional platforms, I would gladly
accept the additions into the project.

## Installation

To install, run the following command:

	cordova plugin add https://github.com/jbroadway/asl-player.git

## Usage

This plugin defines a Javascript object by the name of `ASLPlayer` with the
following methods:

* `ASLPlayer.create(file)` - Create a new ASL player with the specified file.
* `ASLPlayer.play()` - Play the currently set video after it's been created.
* `ASLPlayer.pause()` - Pause the currently playing video.
* `ASLPlayer.seek(to)` - Change the seek time of the currently playing video.
* `ASLPlayer.hide()` - Hide the ASL player, pausing if it's currently playing.

Please note that the files should be `.mp4` and the file name sent to
`ASLPlayer.create(file)` should omit the file extension.

For example, if your ASL videos are located in the folder `assets/asl`, then
you would specify the files like this:

	ASLPlayer.create('assets/asl/video_01')

This will load the video file `assets/asl/video_01.mp4`.

## Dimensions

The player is shown in the bottom right 220x235 corner of the screen. This is
the width-to-height ratio your video files should be set to.

## Credits
 
This plugin was originally created for an exhibit at the [Canadian Museum for
Human Rights](https://humanrights.ca/) and was developed by [The Campfire
Union](https://www.campfireunion.com/).
