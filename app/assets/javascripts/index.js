$(document).ready(function () {

    /* Scrolla till anchors */
    var $root = $('html, body');
    $('a').click(function () {
        $root.animate({
            scrollTop: $($.attr(this, 'href')).offset().top - 50
        }, 500);
        return false;
    });

    if(! /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
        /* Fade in navbar*/
        var fadeStart = 100 // 100px scroll or less will equiv to 0 opacity
        ,fadeUntil = 200 // 100px scroll or more will equiv to 1 opacity
        ,fading = $('.transparentNavbar');

        $(window).bind('scroll', function () {
            var offset = $(document).scrollTop(), opacity = 0;
            if (offset <= fadeStart) {
                opacity = 0;
            } else if (offset <= fadeUntil) {
                opacity = (offset - fadeStart) / (fadeUntil - fadeStart);
            } else if (offset > fadeUntil) {
                opacity = 1;
            }
            fading.css('background-color', 'rgba(248,248,248,' + opacity + ')');
        });

        var arrow = $('.scrollDown');

        $(window).bind('scroll', function () {
            var offset = $(document).scrollTop(), opacity = 1;
            if (offset <= fadeStart) {
                opacity = 1;
            } else if (offset <= fadeUntil) {
                opacity = 1-((offset - fadeStart) / (fadeUntil - fadeStart));
            } else if (offset > fadeUntil) {
                opacity = 0;
            }
            arrow.css('opacity', opacity);
        });
    }

});

/* $('#indexTab a').click(function (e) {
	e.preventDefault()
	$(this).tab('show')
}) */