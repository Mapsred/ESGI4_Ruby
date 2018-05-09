//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets


$(document).ready(function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $('.delete-planet').click(function () {
        let id = $(this).data('id');
        $.ajax({
            type: "DELETE",
            url: "/planets/" + id,
            success: function () {
                window.location.reload();
            }
        });
    });
});