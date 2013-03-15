var ww = {
	app : {},
	templates : {},
	template : function( templateName, templateVars ) {
		var container = $( document.createElement( 'div' ) );
		templateVars = templateVars || {};

		container.
			append( ww.templates[ templateName ] ).
			render( templateVars );

		return container[ 0 ].innerHTML;
	},

	initQueue = $.Deferred,
	init : function( func ) {
		ww.initQueue.done( func );
	}
};

( function( $ ) {
	$( document ).ready( function() {
		ww.init( function() {
			var domTemplates = document.getElementsByClassName( 'ww_template' ),
				bodyEl = document.getElementsByTagName( 'body' )[ 0 ],
				i;

			do {
				ww.templates[ domTemplates[ 0 ].id ] = $.trim( domTemplates[ 0 ].innerHTML );
				bodyEl.removeChild( domTemplates[ 0 ] ); // automatically removes from array
			} while ( domTemplates.length );
		} );
	} );
} )( jQuery );
