$ ->
  $("#slider-range").slider({
  range: true,
  min: $('#slider').data('mindate'),
  max: $('#slider').data('maxdate'),
  values: [ $('#slider').data('mindate'), $('#slider').data('maxdate') ],
  slide: (event,ui) ->
    $("#slider #date").val("Date: " + ui.values[0] + " - " + ui.values[1] )})
  $("#slider #date").val("Date: " + $("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1 ) )
