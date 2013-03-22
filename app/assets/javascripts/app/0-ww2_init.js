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

// ( function() {
// 	var mainViewCore = {
// 			el : '#main',

// 			initialize : function() {
// 				_.bindAll( this );
// 			},

// 			renderLoader : function() {
// 				this.$el.empty().append( ww.template( 'loader' ) );
// 			}
// 		},
// 		mainInit = function() {
// 			ww.app.mainView = new ( Backbone.View.extend( mainViewCore ) )();
// 			ww.app.mainView.renderLoader();
// 		};
// } )();
