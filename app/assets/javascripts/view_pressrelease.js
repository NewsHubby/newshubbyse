$(document).ready(function() {
    
    $('#prStateBtn').click(function() {
        $('.prState').toggleClass('text-info text-primary');
        $('#prStateBtn').toggleClass('btn-info btn-primary');
        $('.prStateText').text(function(i, v) {
            return v === 'olistat' ? 'offentligt' : 'olistat'
        })
    });
    
});