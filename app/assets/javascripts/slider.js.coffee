$ ->
  $("#slider-range").slider({
  range: true,
  min: $('#slider').data('mindate'),
  max: $('#slider').data('maxdate'),
  step: 86400,
  values: [ $('#slider').data('defmin') || $('#slider').data('mindate'), $('#slider').data('defmax') || $('#slider').data('maxdate')],
  slide: (event,ui) ->
    $("#slider #date").val("Date: " + ui.values[0] + " - " + ui.values[1] )
  stop: (event,ui) ->
    value1 = ui.values[0]
    value2 = ui.values[1]

    $.ajax({
      type: "GET",
      url: $('#slider').data('url')+".js",
      data: "start="+value1+"&end="+value2,
      cache: false
      })
    })
  $("#slider #date").val("Date: " + $("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1 ) )
