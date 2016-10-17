$ ->
  $(document).on "turbolinks:load", ->
    $("#content_manager_select_field").select2({
      theme: "bootstrap",
      tags: true,
      placeholder: "Select a Content Contributor"
    });
    return

  $(document).on "click", "#all-contributor-modules", ->
    $(".assigned-modules input").not(this).prop('checked', $(this).prop("checked"));
