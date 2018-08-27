# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.interested_people').click ->
    ride_offer_id = $(this).attr('id')
    title = 'People Interested'
    body = ""

    $.getJSON("/shared_ride_offers/#{ride_offer_id}/people_interested", (response)  ->
      $.each(response, (index, value) ->
        console.log(response)
        body += "<img class='user-photo' src='#{value.image_url}'/>"
        body += "#{value.name} <hr>"
      )

      $('#alertModalTitle').text(title)
      $('#alertModalBody').html(body)
      $('#alertModal').modal('show')
    )

