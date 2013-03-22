var ww = {
	app : {},
	initQueue : [],
	queueAtEnd : [],
	init : function( func ) {
		ww.initQueue.push( func );
	},
	initAtEnd : function( func ) {
		ww.queueAtEnd.push( func );
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
		},
		resizeMainContainer = function() {
			var $mainEl = $( '#main' ),
				mainHeight = $mainEl.outerHeight(),
				mainTitleHeight = $mainEl.find( '.main-title' ).outerHeight(),
				mainContainerHeight = mainHeight - mainTitleHeight;

			$mainEl.find( '.main-container' ).css( 'height', mainContainerHeight + 'px' );
		},
		i = 0;

	for ( i; i < ww.initQueue.length; i++ ) {
		ww.initQueue[ i ]();
	}

	for ( i = 0; i < ww.queueAtEnd.length; i++ ) {
		ww.queueAtEnd[ i ]();
	}

	$( window ).on( 'resize', resizeMainContainer );
	resizeMainContainer();
} )();
