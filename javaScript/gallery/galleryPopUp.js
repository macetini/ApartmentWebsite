window.imgSeq = 0;
window.galleryPopUpLength = 15;

window.popUp = null;

function isNumber(o) {
    return !isNaN(o - 0) && o !== null && o !== "" && o !== false;
}

function setPopUpInfoText(imgSeq)
{
    if (typeof imgSeq !== 'string')
        if (imgSeq < 10)
            imgSeq = "0" + imgSeq;

    var upperText = jQuery.i18n.prop('popUpImg' + imgSeq);

    $('#upperPopUpInfoText').html(upperText);

    $('#imgSeqInfo').html(parseInt(imgSeq, 10) + 1);
    $('#maxImgSeqInfo').html(window.galleryPopUpLength + 1);
}

$('.smallPopUpImgCont, .topImg').live('click', function() {

    if (window.popUp !== null)
        return;

    $.get("data/galleryPopUp.php", {
        imgId: $(this).children().first().attr('id')
    }).done(function(data) {

        window.imgSeq = $($(data)[2]).val();

        $('#mainContent').append('<div> </div>');

        window.popUp = $('#mainContent').children().last();

        window.popUp.addClass('popUp').html(data).fadeIn('fast').on('mouseenter', function() {

            setPopUpInfoText(window.imgSeq);

            $('#rightPopUpVeil').stop().animate({
                marginLeft: '680px'
            }, 600);
            $('#gallPopUpRightContImg').stop().animate({
                marginLeft: '680px'
            }, 600);

            $('#leftPopUpVeil').stop().animate({
                marginLeft: '0px'
            }, 600);
            $('#gallPopUpLeftContImg').stop().animate({
                marginLeft: '0px'
            }, 600);

            $('#lowerPopUpInfo, #lowerPopUpInfoText').stop().animate({
                marginTop: '480px'
            }, 600);

            $('#upperPopUpInfo, #upperPopUpInfoText').stop().animate({
                marginTop: '0px'
            }, 600);


        }).on('mouseleave', function() {

            $('#rightPopUpVeil').stop().animate({
                marginLeft: '740px'
            }, 600);
            $('#gallPopUpRightContImg').stop().animate({
                marginLeft: '740px'
            }, 600);

            $('#leftPopUpVeil').stop().animate({
                marginLeft: '-60px'
            }, 600);
            $('#gallPopUpLeftContImg').stop().animate({
                marginLeft: '-60px'
            }, 600);

            $('#lowerPopUpInfo, #lowerPopUpInfoText').stop().animate({
                marginTop: '505px'
            }, 600);

            $('#upperPopUpInfo, #upperPopUpInfoText').stop().animate({
                marginTop: '-30px'
            }, 600);
        });
    });
});

$('#galPopUpClose').live('click', function() {

    $(window.popUp).fadeOut('fast', function() {

        $(this).remove();

        window.popUp = null;
    });
});


function animateImagePopUpChange(imgSeq) {

    setPopUpInfoText(imgSeq);

    window.disablePopUpClick = true;

    var imgB;

    if (imgSeq < 10)
        imgB = 'imgB0';
    else
        imgB = 'imgB';

    $('#gallPopUpImg0').attr('src', 'images/gallery/bigImages/' + imgB + imgSeq + '.jpg');

    $('#gallPopUpImg1').stop().animate({
        opacity: "0"
    }, 600, function() {

        window.disablePopUpClick = false;

        $('#gallPopUpImg1').attr('src', 'images/gallery/bigImages/' + imgB + imgSeq + '.jpg').css('opacity', 1);
    });
}

$('#gallPopUpRightContImg').live('click', function() {

    if (window.imgSeq < window.galleryPopUpLength)
        window.imgSeq++;
    else
        window.imgSeq = 0;

    animateImagePopUpChange(window.imgSeq);
});

$('#gallPopUpLeftContImg').live('click', function() {

    if (window.imgSeq > 0)
        window.imgSeq--;
    else
        window.imgSeq = window.galleryPopUpLength;

    animateImagePopUpChange(window.imgSeq);
});


$('#gallPopUpContrImg').live('click', function() {

    $('#gallPopUpImg0').css('opacity', 1);

    $('#gallPopUpImg1').animate({
        opacity: "0"
    }, 600, function() {

        if (window.imgSeq < window.galleryPopUpLength)
            window.imgSeq++;
        else
            window.imgSeq = 0;

        var imgB;

        if (imgSeq < 10)
            imgB = 'imgB0';
        else
            imgB = 'imgB';

        $('#gallPopUpImg1').attr('src', 'images/gallery/bigImages/' + imgB + window.imgSeq + '.jpg').css('opacity', 1);

        if (window.imgSeq !== window.galleryPopUpLength)
            $('#gallPopUpImg0').attr('src', 'images/gallery/bigImages/' + imgB + (window.imgSeq + 1) + '.jpg').css('opacity', 0);
        else
            $('#gallPopUpImg0').attr('src', 'images/gallery/bigImages/imgB00.jpg').css('opacity', 0);

        $('#curImgNumb').html((window.imgSeq + 1).toString());
    });
});
