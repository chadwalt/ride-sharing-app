# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#show-interest').click ->
    ride_offer_id = $(this).data('ride_offer_id')

    $.post("/shared_ride_offers/#{ride_offer_id}", (response, status ,request_object) ->
     if request_object.status == 201
      message = 'Interest saved successfully.'
      $('.modal-body').html(message)
      location.reload()
    )
    .error (response, status, request_object) ->
      message = 'Something went wrong.'
      $('.modal-body').html(response.message)

  $('.show_interest_ride_offer').click (event) ->
    ride_offer = $(this).data('rideoffer')
    message = "Are you sure you want to take this ride offer from "
    message += "<b>#{ride_offer.origin}</b> to <b>#{ride_offer.destination}</b> "
    message += "at <b>#{ride_offer.take_off.slice(11, 19)}</b>?"

    $('.modal-body').html(message)
    $('#show-interest').data('ride_offer_id', ride_offer.id)
