window.ASLPlayer = {};

// Create a new ASL player
window.ASLPlayer.create = function (file, callback) {
	cordova.exec (
		callback,
		function (err) {
			callback ();
		},
		"ASLPlayer",
		"create",
		[file]
	);
};

// Play the ASL video, showing it if it is currently hidden.
window.ASLPlayer.play = function (callback) {
	cordova.exec (
		callback,
		function (err) {
			callback ();
		},
		"ASLPlayer",
		"play",
		[]
	);
};

// Pause the ASL video
window.ASLPlayer.pause = function (callback) {
	cordova.exec (
		callback,
		function (err) {
			callback ();
		},
		"ASLPlayer",
		"pause",
		[]
	);
};

// Change the seek time of the ASL video
window.ASLPlayer.seek = function (seek, callback) {
	cordova.exec (
		callback,
		function (err) {
			callback ();
		},
		"ASLPlayer",
		"seek",
		[seek]
	);
};

// Hide the ASL player, pausing it if it is currently playing.
window.ASLPlayer.hide = function (callback) {
	cordova.exec (
		callback,
		function (err) {
			callback ();
		},
		"ASLPlayer",
		"hide",
		[]
	);
};
