var ww = {
	app : {},
	init : function( func ) {
		ww.initQueue.done( func );
	}
};

( function() {
	var mainViewCore = {
			el : '#main',

			initialize : function() {
				_.bindAll( this );
			},

			renderLoader : function() {
				this.$el.empty().append( ww.template( 'loader' ) );
			}
		},
		mainInit = function() {
			ww.app.mainView = new ( Backbone.View.extend( mainViewCore ) )();
			ww.app.mainView.renderLoader();
		};

	yepnope( [
		{
			load : [ // loading libraries
				'/assets/jquery.js?body=1',
				'/assets/libraries/lodash.js?body=1',
				'/assets/libraries/backbone.js?body=1',
				'/assets/libraries/transparency.min.js?body=1',
				'/assets/libraries/timeline-min.js?body=1',
				'/assets/libraries/storyjs-embed.js?body=1'
			],

			complete : function() {
				yepnope( [
					'/assets/libraries/bootstrap.min.js?body=1',
					'/assets/jquery_ujs.js?body=1',
					'/assets/jquery-ui.js?body=1'
				] );
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
				// mainInit();

				// !ww.show_edit_fields && ( Backbone.history.start() ); // start the app, but only if we're not showing edit fields
			}
		}
	] );
} )();
