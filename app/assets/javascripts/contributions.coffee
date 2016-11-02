$ ->
  $(document).on "turbolinks:load", ->
    $("#contributor_select_field").select2({
      theme: "bootstrap",
      tags: true,
      placeholder: "Select or Type a Contributor's Email"
    });
    return

  $(document).on "click", "#all-contributor-modules", ->
    $(".assigned-modules input").not(this).prop('checked', $(this).prop("checked"));
    return
  
  $(document).on "click", ".edit-contributor-btn", ->
    $(this).siblings('form').submit()
    return