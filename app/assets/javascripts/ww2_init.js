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
	}
};

( function( $ ) {
	var routerCore = {
		routes : {
			'/' : 'showAllCampaigns',
			'/campaigns' : 'showAllCampaigns'
		},

		initialize : function() {
			_.bindAll( this );
		},

		showAllCampaigns : function() {
			console.log( arguments );
		}
	};

	$( document ).ready( function() {
		var domTemplates = document.getElementsByClassName( 'ww_template' ),
			bodyEl = document.getElementsByTagName( 'body' )[ 0 ],
			i;

		do {
			ww.templates[ domTemplates[ 0 ].id ] = $.trim( domTemplates[ 0 ].innerHTML );
			bodyEl.removeChild( domTemplates[ 0 ] ); // automatically removes from array
		} while ( domTemplates.length );

		ww.app.router = new ( Backbone.Router.extend( routerCore ) )();
	} );
} )( jQuery );
