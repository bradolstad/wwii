( function( $ ) {
	$( document ).ready( function() {
		$( '.operation-link' ).on( 'mouseenter.showMarker', function() {
			$( this ).click();
		} );
	} );
} )( jQuery );
