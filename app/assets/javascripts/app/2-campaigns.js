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
			name : undefined,

			selected : false
		},

		initialize : function() {
			new campaigns.singleView( { model : this } );

			this.listenTo( this.collection, 'reset', this.teardown );
		},

		teardown : function() {
			this.stopListening();
		}
	};

	campaigns.collectionCore = {
		url : '/campaigns.json',

		initialize : function() {
			_.bindAll( this );

			this.model = campaigns.model;

			this.on( 'change:selected', this.deselectAllExcept );
		},

		fetch : function() {
			var self = this;

			this.reset();

			return $.get( this.url ).done( function( response ) {
				var i = 0;

				for ( i; i < response.length; i++ ) {
					self.add( new self.model( response[ i ], { collection : self } ) );
				}
			} );
		},

		deselectAllExcept : function( selectedCampaignModel ) {
			var unselectedModels = this.without( selectedCampaignModel );

			_.forEach( unselectedModels, function( model ) {
				model.set( 'selected', false, { silent : true} );
			} );
		}
	};

	campaigns.listViewCore = {
		id : 'campaigns',

		initialize : function() {
			_.bindAll( this );
		},

		render : function() {
			this.$el.empty().append( ww.template( 'campaigns_list' ) );

			ww.app.mainView.$el.empty().append( this.el );

			this.trigger( 'render', this );

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

			this.listenTo( ww.app.campaign.listView, 'render', this.render );
			this.listenTo( this.model.collection, 'reset', this.teardown );
		},

		render : function() {
			var templateVars = this.model.toJSON();

			this.$el.empty().append( ww.template( 'campaign_list_item', templateVars ) ).
				appendTo( ww.app.campaign.listView.$el.find( '#campaigns-list' ) );

			return this;
		},

		showCampaign : function( ev ) {
			ww.app.router.navigate( '/campaigns/' + this.model.get( 'id' ) + '/', { trigger : true } );

			return false;
		},

		teardown : function() {
			this.remove();
			this.stopListening();
			this.model = undefined;
		}
	};

	ww.init( function() {
		campaigns.
			setup().
			init();
	} );
} )( jQuery );
