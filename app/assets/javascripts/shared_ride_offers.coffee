# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#show-interest').click ->
    ride_offer_id = $(this).data('ride_offer_id')

    $.post("/shared_ride_offers/#{ride_offer_id}", (response, status ,request_object) ->
      $('.modal-body').html(response.message)
      location.reload()
    , 'JSON')
    .fail (response) ->
      display_withdraw_interest()
      $('.modal-body').html(response.responseJSON.message)

  $('.show_interest_ride_offer').click (event) ->
    ride_offer = $(this).data('rideoffer')
    message = "Are you sure you want to take this ride offer from "
    message += "<b>#{ride_offer.origin}</b> to <b>#{ride_offer.destination}</b> "
    message += "at <b>#{ride_offer.take_off.slice(11, 19)}</b>?"
    interested_counts = $(this).data('interestedcounts')
    display_show_interest_button()

    if ride_offer.no_of_people == interested_counts
      message = 'Maximum number of people reached.'
      $('#rideOfferSignupAlert').modal('show')
    else
      $('#show-interest-modal').modal('show')
      $('#show-interest').data('ride_offer_id', ride_offer.id)

    $('.modal-body').html(message)

  $('#withdraw-interest').click ->
    ride_offer_id = $('#show-interest').data('ride_offer_id')

    $.ajax({
      url: "/shared_ride_offers/#{ride_offer_id}",
      method: 'DELETE',
      dataType: 'JSON'
    }).done((response) ->
      location.reload()
    ).fail((response) ->
      display_show_interest_button()
    )

display_show_interest_button = () ->
  $('#show-interest').show();
  $('#withdraw-interest').hide();

display_withdraw_interest = () ->
  $('#withdraw-interest').show();
  $('#show-interest').hide();
