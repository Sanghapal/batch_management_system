$(document).ready ->
  get_cities = (val, element, page) ->
    if page == 'booking'
      states.filter (x) ->
        update_cities x, element, page  if x._id is val
    else
      states.filter (x) ->
        update_cities x, element, page  if x.name is val
      

  update_cities = (state, element, page) ->
    cities = state.cities
    $("#" + element).empty()
    $("#" + element).append "<option value=\"\"> </option>"
    i = 0
    _results = []
    if page == 'booking'
      while i < cities.length
        $("#" + element).append "<option value=\"" + cities[i]._id + "\"> " + cities[i].name + " </option>"
        _results.push 
        i++
    else
      while i < cities.length
        $("#" + element).append "<option value=\"" + cities[i].name + "\"> " + cities[i].name + " </option>"
        _results.push 
        i++
      
    _results

  $(".state").on "change", (e) ->
    state_id = $(this).attr("id")
    page = $(this).attr('page')
    state = $("#" + state_id).val()
    city_id = state_id.replace("state", "city")
    get_cities state, city_id, page  unless state is ""
