$ ->
  $("#slider-range").slider({
  range: true,
  min: $('#slider').data('mindate'),
  max: $('#slider').data('maxdate'),
  step: 86400,
  values: [ $('#slider').data('defmin') || $('#slider').data('mindate'), $('#slider').data('defmax') || $('#slider').data('maxdate')],
  slide: (event,ui) ->
    $("#slider #date").val("Date: " + $.datepicker.formatDate('M d yy', new Date(ui.values[0]*1000)) + " - " + $.datepicker.formatDate('M d yy', new Date(ui.values[1]*1000)) )
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
  $("#slider #date").val("Date: " + $.datepicker.formatDate('M d yy', new Date($("#slider-range").slider("values", 0)*1000)) + " - " + $.datepicker.formatDate('M d yy', new Date($("#slider-range").slider("values", 1 )*1000)) )
