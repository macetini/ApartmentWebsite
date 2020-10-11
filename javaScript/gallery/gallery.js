/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

window.imgSeq = 0;

window.play = false;

window.galleryLength = 16;

window.page = 0;
window.pageLength = 8;
window.numberOfPages = 2;

function galleryInitVals()
{
    window.imgSeq = 0;

    window.play = false;

    window.galleryLength = 16;

    window.page = 0;
    window.pageLength = 8;
    window.numberOfPages = 2;
}

$('#gallContainer').live('mouseenter', function() {

    $('#galleryInfoVeil').stop().animate({
        marginTop: "-510px"
    }, 450);

    $('#galleryControls').stop().animate({
        marginTop: "405px"
    }, 450);

});

$('#gallContainer').live('mouseleave', function() {

    $('#galleryInfoVeil').stop().animate({
        marginTop: "-545px"
    }, 450);

    $('#galleryControls').stop().animate({
        marginTop: "518px"
    }, 450);

});

function animateImageChange(imgSeq) {

    setContrImgBorder(imgSeq);

    $('#curImgNumb').html((window.imgSeq + 1).toString());

    var imgB;

    if (window.imgSeq < 10)
        imgB = 'imgB0';
    else
        imgB = 'imgB';


    $('#gallImg1').attr('src', 'images/gallery/bigImages/' + imgB + window.imgSeq + '.jpg');

    $('#gallImg2').stop().animate({
        opacity: "0"
    }, 450, function() {

        $('#gallImg2').attr('src', 'images/gallery/bigImages/' + imgB + window.imgSeq + '.jpg').css('opacity', 1);
    });
}

function setGalleryImgText(imgSeq)
{
    var galleryImgText = jQuery.i18n.prop('galleryImgText' + window.imgSeq);

    $('#galleryImgText').html(galleryImgText);
}

$('#galRight').live('click', function() {

    window.play = false;

    $('#galPlay').attr('src', 'images/gallery/controls/play.gif');

    if (window.imgSeq < window.galleryLength - 1)
    {
        window.imgSeq++;

        if (window.imgSeq === ((window.page + 1) * window.pageLength))
        {
            changePage(++window.page);
            return;
        } else
            setGalleryImgText(window.imgSeq);
    }
    else {
        window.imgSeq = 0;
        window.page = 0;
        changePage(window.page);
        return;
    }

    animateImageChange(window.imgSeq);
});

$('#galLeft').live('click', function() {

    window.play = false;

    $('#galPlay').attr('src', 'images/gallery/controls/play.gif');

    if (window.imgSeq > 0)
    {
        window.imgSeq--;

        if (window.imgSeq < (window.page * window.pageLength))
        {
            changePage(--window.page);
            return;
        } else
            setGalleryImgText(window.imgSeq);
    }
    else {
        window.imgSeq = window.galleryLength - 1;
        window.page = window.numberOfPages - 1;
        changePage(window.page);

        return;
    }

    animateImageChange(window.imgSeq);
});

function gallerySlideShow()
{
    if (!window.play)
        return;

    if (window.imgSeq < window.galleryLength - 1)
    {
        window.imgSeq++;

        if (window.imgSeq === ((window.page + 1) * window.pageLength))
        {
            changePage(++window.page);
            return;
        } else
            setGalleryImgText(window.imgSeq);
    }
    else {

        window.imgSeq = 0;
        window.page = 0;
        changePage(window.page);
        return;
    }

    $('#curImgNumb').html((window.imgSeq + 1).toString());

    setContrImgBorder(window.imgSeq);

    var imgB;

    if (window.imgSeq < 10)
        imgB = 'imgB0';
    else
        imgB = 'imgB';

    $('#gallImg1').attr('src', 'images/gallery/bigImages/' + imgB + window.imgSeq + '.jpg');

    $('#gallImg2').animate({
        opacity: "0"
    }, 450, function() {

        if (!window.play)
            return;

        if (window.imgSeq < 10)
            imgB = 'imgB0';
        else
            imgB = 'imgB';

        $('#gallImg2').attr('src', 'images/gallery/bigImages/' + imgB + window.imgSeq + '.jpg').css('opacity', 1);

        setTimeout("gallerySlideShow()", 1200);
    });
}

$('#galPlay').live('click', function() {

    if (!window.play)
        $('#galPlay').attr('src', 'images/gallery/controls/pause.gif');
    else
        $('#galPlay').attr('src', 'images/gallery/controls/play.gif');

    window.play = !window.play;

    if (window.play)
        gallerySlideShow();

});

function setContrImgBorder(imgSeq)
{
    imgSeq -= (window.pageLength * window.page);

    $('.contrImg').removeClass('imgSelected').addClass('imgNotSelected');

    $('#gallContImg' + imgSeq).addClass('imgSelected');
}

$('.contrImg').live('click', function() {

    window.play = false;

    var contrImgNum = ($(this).attr('id')).charAt(11);

    window.imgSeq = Number(contrImgNum);

    window.imgSeq += window.page * window.pageLength;

    animateImageChange(window.imgSeq);
});

function changePage(page)
{
    setGalleryImgText(window.imgSeq);

    $('.contrImg').stop().fadeOut('fast').fadeIn('fast');

    $('.contrImg').each(function() {
        $(this).stop().fadeOut('fast');
    });

    $('.contrImg').promise().done(function() {

        var numbOfImg = window.pageLength;

        var imgCount = 0;

        numbOfImg *= (page + 1);

        var startImgNum = page * window.pageLength;

        var imgS;

        for (var i = startImgNum; i < numbOfImg; i++)
        {
            if (i < 10)
                imgS = 'imgS0';
            else
                imgS = 'imgS';

            $('#gallContImg' + imgCount).attr('src', 'images/gallery/smallImages/' + imgS + i + '.jpg');

            imgCount++;
        }

        animateImageChange(window.imgSeq);

        $(this).fadeIn('fast', function() {

            if (!window.play)
                return;
        });

        setTimeout("gallerySlideShow()", 1400);
    });
}

$('#galDoubleRight').live('click', function() {

    window.play = false;

    if (window.page < 1)
        window.page++;
    else {
        window.page = 0;
        window.imgSeq = 0;
    }

    window.imgSeq = window.page * window.pageLength;

    changePage(window.page);
});

$('#galDoubleLeft').live('click', function() {

    window.play = false;

    if (window.page > 0)
        window.page--;
    else {
        window.page = window.numberOfPages - 1;
        window.imgSeq = window.page * window.pageLength;
    }

    window.imgSeq = window.page * window.pageLength;

    changePage(window.page);
});