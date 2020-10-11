/**
 * index.js
 * 
 * Created by Marko Cetinić
 * 
 * Free fall all :)
 */

window.slideShowFlag = true; // flag that indicates the state of the slide - show animation

function processSlideshow(elem, imageListArr, fadeSpeed, current, flag) {

    if (!window.slideShowFlag)
        return;

    var listSize = imageListArr.length;

    if (!current || current >= listSize)
        current = 0;

    if (flag === 0)
        $(elem + " img").attr("src", imageListArr[current]).animate({
            opacity: "1"
        }, 1, function() {
            processSlideshow(elem, imageListArr, fadeSpeed, current + 1, 1);
        });
    else {

        if (current === (listSize))
            $(elem).css("background",
                    "transparent url(" + imageListArr[0] + ") no-repeat");
        else
            $(elem).css("background",
                    "transparent url(" + imageListArr[current] + ") no-repeat");

        $(elem + " img").animate({
            opacity: "0"
        }, fadeSpeed, function() {
            processSlideshow(elem, imageListArr, fadeSpeed, current, 0);
        });
    }
}

function startSlideshow() {

    var slideShowArr = new Array();

    slideShowArr[0] = "images/index/indexImg0.jpg";
    slideShowArr[1] = "images/index/indexImg1.jpg";
    slideShowArr[2] = "images/index/indexImg2.jpg";
    slideShowArr[3] = "images/index/indexImg3.jpg";
    slideShowArr[4] = "images/index/indexImg4.jpg";
    slideShowArr[5] = "images/index/indexImg5.jpg";
    slideShowArr[6] = "images/index/indexImg6.jpg";
    slideShowArr[7] = "images/index/indexImg7.jpg";

    processSlideshow("#slideshow", slideShowArr, 1800, 0, 0);
}

function showWelcomeScreen() {

    $('#loadingPercent').remove();

    var loading = jQuery.i18n.prop('loadingTxt');

    $('#loadingTxt').text(loading);

    $("#mainWindow").fadeIn("slow", function() {
        setTimeout("startSlideshow()", 700);
        var map = new google.maps.Map(document.getElementById("mapCanvas"), window.mapOptions);

        var marker = new google.maps.Marker({
            position: window.latlng,
            map: map,
            title: "Apartment Danica"
        });

        google.maps.event.addListener(marker, "click", function() {

            var url = "http://maps.google.com/maps?q=Dubrovnik,+Stulina+2&hl=en&ie=UTF8&ll=42.640928,18.109782&spn=0.006409,0.009645&sll=42.948381,18.500977&sspn=3.264846,4.938354&hnear=Stulina+ulica+2,+20000,+Dubrova%C4%8Dko-neretvanska+%C5%BEupanija,+Croatia&t=h&z=17";

            window.open(url);
        });
    });
}

/*
 * Waiting for the HTML document 'ready' event.
 * 
 */

$(document).ready(preload);