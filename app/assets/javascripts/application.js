// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
<<<<<<< HEAD
//= require_tree .

$(document).on('turbolinks:load', function () {
  $('.time').focus();
  $('.modal-footer .btn-primary').click(function () {
    $(".modal-body form").submit();
  });
});
$('.crypto-name').popover({
  trigger: 'hover'
});
=======
//= require_tree
>>>>>>> cbbfe13f902c41ebe3f669384c126cc771ac0e7b
