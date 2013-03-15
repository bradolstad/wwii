( function( $ ) {
	var templates = {};

	templates.setup = function() {
		ww.templates = {};
		ww.template = function( templateName, templateVars ) {
			var container = $( document.createElement( 'div' ) );
			templateVars = templateVars || {};

			container.
				append( ww.templates[ templateName ] ).
				render( templateVars );

			return container[ 0 ].innerHTML;
		};

		return templates;
	};

	templates.load = function() {
		var domTemplates = document.getElementsByClassName( 'ww_template' ),
			bodyEl = document.getElementsByTagName( 'body' )[ 0 ],
			i;

		domTemplates[ 0 ] && ( function() {
			do {
				ww.templates[ domTemplates[ 0 ].id ] = $.trim( domTemplates[ 0 ].innerHTML );
				bodyEl.removeChild( domTemplates[ 0 ] ); // automatically removes from array
			} while ( domTemplates.length );
		} )();

		return templates;
	};

	ww.init( function() {
		templates.
			setup().
			load();
	} );
} )( jQuery );
