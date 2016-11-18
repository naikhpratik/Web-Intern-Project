// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// // #
// $(document).on 'turbolinks:load', ->
//   $('#quiztimer').countdown
//     until: gon.time * 60
//     format: 'HMS'
//   return

// $(document).on('turbolinks:load', function() {
//   $('#quiztimer').countdown({
//     until: gon.time * 60,
//     format: 'HMS'
//   });
// });

function timer() {
  //  alert('Hello');
    $('#quiztimer').countdown({
      until: gon.time * 60,
      format: 'HMS'
    });
    document.getElementById("quiztimer").style.display = "";
}
// # $(document).on('turbolinks:load', function() {
// #   $('#quiztimer').countdown({
// #     until: gon.time * 60,
// #     format: 'HMS'
// #   });
// # });
//
// # $("startclicked").on 'click', ->
// #   $('#quiztimer').countdown
// #     until: gon.time * 60
// #     format: 'HMS'
// #   return
// #
// # $('#startclicked').bind 'click','turbolinks:load', ->
// #   $('#quiztimer').countdown
// #     until: gon.time * 60
// #     format: 'HMS'
// #   return
