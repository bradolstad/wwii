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

			this.listenTo( this.collection, 'reset', this.teardown );
		},

		teardown : function() {
			this.stopListening();
		}
	};

	operations.collectionCore = {
		initialize : function() {
			_.bindAll( this );

			this.model = operations.model;
		},

		setUrl : function( campaignId ) {
			this.url = '/campaigns/'+ campaignId +'.json';
			return this;
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

		deselectAllExcept : function( selectedOperationModel ) {
			var unselectedModels = this.without( selectedOperationModel );

			_.forEach( unselectedModels, function( model ) {
				model.set( 'selected', false, { silent : true} );
			} );
		}
	};

	operations.listViewCore = {
		id : 'operations',

		initialize : function() {
			_.bindAll( this );
		},

		render : function() {
			var campaignVars = ww.app.campaign.collection.where( { selected : true } )[ 0 ].toJSON();
			this.$el.empty().append( ww.template( 'operations_list', campaignVars ) );

			ww.app.mainView.$el.empty().append( this.el );

			this.trigger( 'render', this );

			return this;
		}
	};

	operations.singleViewCore = {
		tagName : 'li',
		className : 'main-list-item operation-list-item',
		events : {
			'click .operation-link' : 'showOperation'
		},

		initialize : function() {
			_.bindAll( this );

			this.listenTo( ww.app.operation.listView, 'render', this.render );
			this.listenTo( this.model.collection, 'reset', this.teardown );
		},

		render : function() {
			var templateVars = this.model.toJSON();

			this.$el.empty().append( ww.template( 'operation_list_item', templateVars ) ).
				appendTo( ww.app.operation.listView.$el.find( '#operations-list' ) );

			return this;
		},

		showOperation : function( ev ) {
			ww.app.router.navigate( 'campaigns/'+ ww.app.campaign.collection.where( { selected : true } )[ 0 ].get( 'id' ) +'/operations/' + this.model.get( 'id' ) + '/', { trigger : true } );

			return false;
		},

		teardown : function() {
			this.remove();
			this.stopListening();
			this.model = undefined;
		}
	};

	operations.detailViewCore = {};

	ww.init( function() {
		operations.
			setup().
			init();
	} );
} )( jQuery );
