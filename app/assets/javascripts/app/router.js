( function( $ ) {
	var routerCore = {
			routes : {
				'(/)' : 'navigateToCampaigns',
				'campaigns/' : 'showAllCampaigns',
				'campaigns/:campaignId/' : 'showOperationsForCampaign',
				'campaigns/:campaignId/operations/:operationId/' : 'showEventsForOperation'
			},

			initialize : function() {
				_.bindAll( this );
			},

			navigateToCampaigns : function() {
				this.navigate( '/campaigns/', { replace : true, trigger : true } );
			},

			getAllCampaigns : function() {
				return ww.app.campaign.collection.fetch();
			},

			showAllCampaigns : function() {
				ww.app.mainView.renderLoader();

				this.getAllCampaigns().done( function() {
					ww.app.campaign.listView.render();
				} );
			},

			getOperationsForCampaign : function( campaignId ) {
				ww.app.campaign.collection.where( { id : campaignId } )[ 0 ].set( 'selected', true );

				return ww.app.operation.collection.
					setUrl( campaignId ).
					fetch();
			},

			showOperationsForCampaign : function( campaignId ) {
				var self = this;
				campaignId = parseInt( campaignId, 10 );

				ww.app.mainView.renderLoader();

				if ( ww.app.campaign.collection.length ) {
					this.getOperationsForCampaign( campaignId ).done( function() {
						ww.app.operation.listView.render();
					} );
				} else {
					this.getAllCampaigns().done( function() {
						self.getOperationsForCampaign( campaignId ).done( function() {
							ww.app.operation.listView.render();
						} );
					} );
				}
			},

			getEventsForOperation : function( operationId ) {
				ww.app.operation.collection.where( { id : operationId } )[ 0 ].set( 'selected', true );
				// ww.app.operation.collection.
				// 	setUrl( campaignId ).
				// 	fetch().done( function() {
				// 		ww.app.operation.collection.trigger( 'render' );
				// 	} );
				// ww.app.operation.listView.render();
			},

			showEventsForOperation : function( campaignId, operationId ) {
				var self = this;
				campaignId = parseInt( campaignId, 10 );
				operationId = parseInt( operationId, 10 );

				ww.app.mainView.renderLoader();

				if ( ww.app.campaign.collection.length ) {
					if ( ww.app.operation.collection.length ) {
						this.getEventsForOperation( operationId );
					} else {
						this.getOperationsForCampaign( campaignId ).done( function() {
							this.getEventsForOperation( operationId );
						} );
					}
				} else {
					this.getAllCampaigns().done( function() {
						self.getOperationsForCampaign( campaignId ).done( function() {
							self.getEventsForOperation( operationId );
						} );
					} );
				}
			}
		};

	ww.init( function() {
		ww.app.router = new ( Backbone.Router.extend( routerCore ) )();
	} );
} )( jQuery );
