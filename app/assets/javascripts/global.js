/* GLOBAL JS */

$(document).ready(function() {

    //denna funktion ligger här bara tillfälligt. Ska egentligen ligga in global.js men jag lyckas inte göra så att global.js laddas in. /Roland
    // Display uploaded file filename
    // if (document.getElementById("uploadBtn")) {
    //     document.getElementById("uploadBtn").onchange = function () {
    //         document.getElementById("uploadFile").value = this.value.replace(/^.*\\/, "");
    //     };
    // }

    if ( $('.upload') ) {

        $('.upload').change(function() {
            $('.uploadFile').val($(this).val().replace(/^.*\\/, "")); //= this.value.replace(/^.*\\/, "");
        });
    }

});
