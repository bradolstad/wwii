( function( $ ) {
	var operations = {};

	operations.setup = function() {
		var o = operations;

		o.model = Backbone.Model.extend( o.modelCore );
		o.collection = Backbone.Collection.extend( o.collectionCore );
		o.listView = Backbone.View.extend( o.listViewCore );
		o.singleView = Backbone.View.extend( o.singleViewCore );
		o.detailView = Backbone.View.extend( o.detailViewCore );

		return o;
	};

	operations.init = function() {
		var o = operations,
			app = ww.app.operation = {};

		app.collection = new o.collection();
		app.listView = new o.listView( { collection : app.collection } );
		app.detailView = new o.detailView();

		return o;
	}

	operations.modelCore = {
		defaults : {
			id : undefined,
			campaign_id : undefined,
			name : undefined
		},

		initialize : function() {
			new operations.singleView( { model : this } );
		}
	};

	operations.collectionCore = {
		url : '/operations.json',

		initialize : function() {
			_.bindAll( this );

			this.model = operations.model;
		}
	};

	operations.listViewCore = {
		id : 'operations',

		initialize : function() {
			_.bindAll( this );
		},

		render : function() {
			this.$el.empty().append( ww.template( 'operations_list' ) ).
				appendTo( '#main' );

			return this;
		}
	};

	operations.singleViewCore = {
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
				appendTo( ww.app.campaign.listView.$el.find( '#operations-list' ) );

			return this;
		},

		showOperation : function( ev ) {
			console.log( ev );
			return false;
		}
	};

	operations.detailViewCore = {};

	$( document ).ready( function() {
		operations.
			setup().
			init();
	} );
} )( jQuery );
