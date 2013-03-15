var ww = {
	app : {},
	init : function( func ) {
		ww.initQueue.done( func );
	}
};

( function() {
	yepnope( [
		{
			load : [ // loading libraries
				'/assets/jquery.js?body=1',
				'/assets/libraries/lodash.js?body=1',
				'/assets/libraries/backbone.min.js?body=1',
				'/assets/libraries/transparency.min.js?body=1',
			],

			complete : function() {
				yepnope( '/assets/libraries/bootstrap.min.js?body=1' );
				ww.initQueue = jQuery.Deferred();
			}
		},
		{
			load : [ // loading app
				'/assets/app/templates.js?body=1',
				'/assets/app/router.js?body=1',
				'/assets/app/campaigns.js?body=1',
				'/assets/app/operations.js?body=1'
			],

			complete : function() {
				ww.initQueue.resolve();

				Backbone.history.start(); // start the app!
			}
		}
	] );
} )();
