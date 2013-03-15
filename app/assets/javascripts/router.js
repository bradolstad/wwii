( function( $ ) {
	var routerCore = {
		routes : {
			'/' : 'showAllCampaigns',
			'/campaigns' : 'showAllCampaigns'
		},

		initialize : function() {
			_.bindAll( this );
		},

		showAllCampaigns : function() {
			console.log( arguments );
		}
	};

	ww.init( function() {
		ww.app.router = new ( Backbone.Router.extend( routerCore ) )();
	} );
} )( jQuery );
