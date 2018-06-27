//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require turbolinks
//= require moment
//= require daterangepicker
//= require select2
//= require select2_locale_fr
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap

let Table = {
    init: function () {
        Table.initTable();
    },

    initTable: function () {
        $('#dataTable tfoot th').each(function () {
            let title = $(this).text();
            let disabled = $(this).hasClass('disabled') ? 'disabled' : '';

            $(this).html('<input type="text" class="form-control column_search" style="width: 100%" ' +
                'placeholder="' + title + '" ' + disabled + ' />');
        });

        Table.table = $('#dataTable').DataTable({
            "scrollX": true,
            'language': {
                "sProcessing": "Traitement en cours...",
                "sSearch": "Rechercher selon n'importe quel critère&nbsp;:",
                "sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
                "sInfo": "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                "sInfoEmpty": "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
                "sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                "sInfoPostFix": "",
                "sLoadingRecords": "Chargement en cours...",
                "sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
                "sEmptyTable": "Aucune donn&eacute;e disponible dans le tableau",
                "oPaginate": {
                    "sFirst": "Premier",
                    "sPrevious": "Pr&eacute;c&eacute;dent",
                    "sNext": "Suivant",
                    "sLast": "Dernier"
                },
                "oAria": {
                    "sSortAscending": ": activer pour trier la colonne par ordre croissant",
                    "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
                }
            },
            "sPaginationType": "full_numbers",
        });

        $('#dataTable_wrapper').on('keyup', ".column_search", function () {
            Table.table.column($(this).parent().index()).search(this.value).draw();
        });

    },
};


$(document).ready(function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });

    let dateFormat = "DD/MM/YYYY";
    $('[data-provider="daterange"]').daterangepicker({
        autoUpdateInput: false,
        autoApply: true,
        locale: {
            "format": dateFormat,
            "separator": " - ",
            "applyLabel": "Valider",
            "cancelLabel": "Annuler",
            "fromLabel": "De",
            "toLabel": "A",
            "customRangeLabel": "Custom",
            "weekLabel": "S",
            "daysOfWeek": ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
            "monthNames": ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre",
                "Octobre", "Novembre", "Decembre"],
            "firstDay": 1
        },
        minDate: moment().add(1, 'days'),
        opens: "right"
    }).on('apply.daterangepicker', function (ev, picker) {
        if (this.id === 'expedition_end_date') {
            $('#expedition_end_date').blur();
        }

        $('#expedition_start_date').val(picker.startDate.format(dateFormat));
        $('#expedition_end_date').val(picker.endDate.format(dateFormat));
        $(this).trigger('change').trigger('keyup');
    }).on('show.daterangepicker', function () {
        var startDate = $('#expedition_start_date').val();
        var endDate = $('#expedition_end_date').val();

        $('[name=daterangepicker_start]').val(startDate).trigger('change').trigger('keyup');
        $('[name=daterangepicker_end]').val(endDate).trigger('change').trigger('keyup');

        if (this.id === 'expedition_end_date') {
            $('[name=daterangepicker_end]').focus();
        }
    });

    $('[data-provider="select2"]').select2({
        theme: "bootstrap",
        language: "fr"
    });

    $('[data-provider="select2-multiple"]').select2({
        theme: "bootstrap",
        language: "fr",
        multiple: true,
    });

    Table.init();
});