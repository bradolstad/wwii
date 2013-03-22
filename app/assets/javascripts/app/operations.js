( function( $ ) {
	var operations = {};

	operations.setup = function() {
		var o = operations;

		o.model = Backbone.Model.extend( o.modelCore );
		o.collection = Backbone.Collection.extend( o.collectionCore );
		o.listView = Backbone.View.extend( o.listViewCore );
		o.singleView = Backbone.View.extend( o.singleViewCore );
		o.eventModel = Backbone.Model.extend( o.eventModelCore );
		o.eventsCollection = Backbone.Collection.extend( o.eventsCollectionCore );
		o.timelineView = Backbone.View.extend( o.timelineViewCore );

		return o;
	};

	operations.init = function() {
		var o = operations,
			app = ww.app.operation = {};

		app.collection = new o.collection();
		app.listView = new o.listView( { collection : app.collection } );
		app.eventsCollection = new o.eventsCollection();
		app.timelineView = new o.timelineView( { collection : app.eventsCollection } );

		return o;
	};

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

		showOperation : function() {
			ww.app.router.navigate( 'campaigns/'+ ww.app.campaign.collection.where( { selected : true } )[ 0 ].get( 'id' ) +'/operations/' + this.model.get( 'id' ) + '/', { trigger : true } );

			return false;
		},

		teardown : function() {
			this.remove();
			this.stopListening();
			this.model = undefined;
		}
	};

	operations.eventModelCore = {
		defaults : {
			date : undefined,
			event_id : undefined,
			lat : undefined,
			lng : undefined,
			marker_icon : undefined,
			name : undefined,
			tooltip : undefined
		}
	};

	operations.eventsCollectionCore = {
		initialize : function() {
			this.model = operations.eventModel;
		},

		comparator : function( model ) {
			return model.get( 'date' );
		}
	};

	operations.timelineViewCore = {
		initialize : function() {
			_.bindAll( this );

			this.listenTo( this.collection, 'reset', this.render );

			this.setElement( '#timeline' );
		},

		set_default_min_date : function( defmin ) {
			this.defmin = defmin;
		},

		render : function() {
			var minDate = this.collection.min( function( model ) { return model.get( 'date' ); } ).get( 'date' ),
				maxDate = this.collection.max( function( model ) { return model.get( 'date' ); } ).get( 'date' ),
				$dateEl = this.$el.children( '.date' );

			this.$el.children( '.slider' ).slider( {
				min : minDate,
				max : maxDate,
				step : 86400,
				value : this.defmin || minDate,
				slide : this.ev_change_date_display,
				stop : this.determine_nearest_event_date
			} );
		},

		ev_change_date_display : function( ev, ui ) {
			var date = new Date( ui.value * 1000 );

			this.change_date_display( date );
		},

		change_date_display : function( date ) {
			var month = $.datepicker.regional[""].monthNamesShort[ date.getUTCMonth() ],
				day_of_month = date.getUTCDate(),
				year = date.getUTCFullYear();

			this.$el.children( '.date' ).empty().append( month +' '+ day_of_month +', '+ year );
		},

		determine_nearest_event_date : function( ev, ui ) {
			var ubound_date, lbound_date,
				current_date = ui.value,
				models_by_date = this.collection.sortBy( 'date' ),
				i,
				selectedDate;

			for ( i = 0; i < models_by_date.length; i++ ) {
				ubound_date = models_by_date[ i ].attributes.date;

				if ( ubound_date > current_date ) {
					i = models_by_date.length;
					selectedDate = this.date_difference( ubound_date, current_date ) > this.date_difference( lbound_date, current_date ) ?
							lbound_date :
							ubound_date;

					this.move_slider_to_date( selectedDate ).
						change_date_display( new Date( selectedDate * 1000 ) );
				} else {
					lbound_date = ubound_date;
				}
			}
		},

		date_difference : function( date_1, date_2 ) {
			return Math.abs( date_1 - date_2 );
		},

		move_slider_to_date : function( date ) {
			this.$el.children( '.slider' ).slider( 'value', date );
			this.show_events_for_day( date );

			return this;
		},

		show_events_for_day : function( date ) {
			var events_for_day = this.collection.where( { date : date } ),
				events_json = [],
				i;

			for ( i = 0; i < events_for_day.length; i++ ) {
				events_json.push( events_for_day[ i ].toJSON() );
			}

			Gmaps.map.replaceMarkers( events_json );
		}
	};

	ww.init( function() {
		operations.
			setup().
			init();
	} );
} )( jQuery );
