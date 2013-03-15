( function( $ ) {
	var routerCore = {
			routes : {
				'' : 'showAllCampaigns',
				'/' : 'showAllCampaigns',
				'/campaigns' : 'showAllCampaigns'
			},

			initialize : function() {
				_.bindAll( this );
			},

			showAllCampaigns : function() {
				ww.app.campaign.collection.fetch().done( function() {
					ww.app.campaign.collection.trigger( 'render' );
				} );
				ww.app.campaign.listView.render();
			}
		};

	ww.init( function() {
		ww.app.router = new ( Backbone.Router.extend( routerCore ) )();
	} );
} )( jQuery );
