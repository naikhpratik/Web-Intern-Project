$ ->
  $(document).on "turbolinks:load", ->
    $("#product_managers_select_field").select2({
      theme: "bootstrap",
      placeholder: "Select Product Managers(s)"
    });

