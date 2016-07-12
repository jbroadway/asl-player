window.ASLPlayer = {
	// Create a new ASL player
	create: function (file, callback) {
		cordova.exec (
			callback,
			function (err) {
				callback ();
			},
			"ASLPlayer",
			"create",
			[file]
		);
	},

	// Play the ASL video, showing it if it is currently hidden.
	play: function (callback) {
		cordova.exec (
			callback,
			function (err) {
				callback ();
			},
			"ASLPlayer",
			"play",
			[]
		);
	},

	// Pause the ASL video
	pause: function (callback) {
		cordova.exec (
			callback,
			function (err) {
				callback ();
			},
			"ASLPlayer",
			"pause",
			[]
		);
	},

	// Change the seek time of the ASL video
	seek: function (seek, callback) {
		cordova.exec (
			callback,
			function (err) {
				callback ();
			},
			"ASLPlayer",
			"seek",
			[seek]
		);
	},

	// Hide the ASL player, pausing it if it is currently playing.
	hide: function (callback) {
		cordova.exec (
			callback,
			function (err) {
				callback ();
			},
			"ASLPlayer",
			"hide",
			[]
		);
	}
};
