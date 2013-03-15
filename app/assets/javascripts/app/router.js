( function( $ ) {
	var routerCore = {
			routes : {
				'(/)' : 'navigateToCampaigns',
				'campaigns/' : 'showAllCampaigns',
				'campaigns/:campaignId/(:action)' : 'showCampaignOperations'
			},

			initialize : function() {
				_.bindAll( this );
			},

			navigateToCampaigns : function() {
				this.navigate( '/campaigns/', { replace : true, trigger : true } );
			},

			showAllCampaigns : function() {
				ww.app.campaign.collection.fetch().done( function() {
					ww.app.campaign.collection.trigger( 'render' );
				} );
				ww.app.campaign.listView.render();
			},

			showCampaignOperations : function( campaignId, action ) {

			}
		};

	ww.init( function() {
		ww.app.router = new ( Backbone.Router.extend( routerCore ) )();
	} );
} )( jQuery );
