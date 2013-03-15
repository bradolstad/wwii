( function( $ ) {
	var campaigns = {};

	campaigns.setup = function() {
		var c = campaigns;

		c.model = Backbone.Model.extend( c.modelCore );
		c.collection = Backbone.Collection.extend( c.collectionCore );
		c.listView = Backbone.View.extend( c.listViewCore );
		c.singleView = Backbone.View.extend( c.singleViewCore );

		return c;
	};

	campaigns.init = function() {
		var c = campaigns,
			app = ww.app.campaign = {};

		app.collection = new c.collection();
		app.listView = new c.listView( { collection : app.collection } );

		return c;
	}

	campaigns.modelCore = {
		defaults : {
			id : undefined,
			name : undefined
		},

		initialize : function() {
			new campaigns.singleView( { model : this } );
		}
	};

	campaigns.collectionCore = {
		url : '/campaigns.json',

		initialize : function() {
			_.bindAll( this );

			this.model = campaigns.model;
		}
	};

	campaigns.listViewCore = {
		id : 'campaigns',

		initialize : function() {
			_.bindAll( this );
		},

		render : function() {
			this.$el.empty().append( ww.template( 'campaigns_list' ) ).
				appendTo( '#main' );

			return this;
		}
	};

	campaigns.singleViewCore = {
		tagName : 'li',
		className : 'main-list-item campaign-list-item',
		events : {
			'click .campaign-link' : 'showCampaign'
		},

		initialize : function() {
			_.bindAll( this );

			ww.app.campaign.collection.on( 'render', this.render );
		},

		render : function() {
			var templateVars = this.model.toJSON();

			this.$el.empty().append( ww.template( 'campaign_list_item', templateVars ) ).
				appendTo( ww.app.campaign.listView.$el.find( '#campaigns-list' ) );

			return this;
		},

		showCampaign : function( ev ) {
			console.log( ev );
			return false;
		}
	};

	$( document ).ready( function() {
		campaigns.
			setup().
			init();
	} );
} )( jQuery );
