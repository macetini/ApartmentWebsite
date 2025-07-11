/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

window.jqXHR;
window.loading;
window.imageFilesArr;
window.imagesLoaded;

/****************************************************************/

function callAjaxLoad(URL, elemId, myData, beforeSendFunc, completeFunc) {

    window.jqXHR = null;

    window.jqXHR = $.ajax({
        url: URL,
        dataType: 'html',
        type: 'GET',
        data: myData,
        beforeSend: function()
        {
            if (typeof(beforeSendFunc) === 'function')
                beforeSendFunc();
        },
        success: function(html) {

            $(elemId).html(html);
        },
        complete: function()
        {
            setLang();

            if (typeof(completeFunc) === 'function')
                completeFunc();
        }
    });
}

function stopLoading() {

    window.loading = false;
}

function callAjaxLoadAfterLoading(URL, DOM, data, beforeLoadingHandler, loadingCompleateHandler) {

    if (!window.loading)
        $("#loadingContaier").fadeOut('fase', function() {
            callAjaxLoad(URL, DOM, data, beforeLoadingHandler, loadingCompleateHandler);
        });
    else
        $("#arms").fadeIn("slow").fadeOut('slow', function() {
            callAjaxLoadAfterLoading(URL, DOM, data, beforeLoadingHandler, loadingCompleateHandler);
        });
}

/****************************************************************/

/****************************************************************/

function imageLoaded() {

    window.imagesLoaded++;

    var percent = Math.round((100 / window.imageFilesArr.length) * window.imagesLoaded);

    if (percent > 100.0)
        percent = 100;

    $('#loadingPercent').html(percent + "%");

    if (window.imagesLoaded === window.imageFilesArr.length)
        window.loading = false;
}

function loadImage(url) {

    var image = new Image();
    $(image).load(imageLoaded);
    image.src = url;

    return image;
}

function armsImgLoaded() {

    $("#arms").addClass('show');

    var images = new Array();

    for (var i = 0; i < window.imageFilesArr.length; i++)
        images[i] = loadImage(window.imageFilesArr[i]);

    callAjaxLoadAfterLoading('ajax/welcome.tpl', '#mainWindow', null, null, showWelcomeScreen);
}

function loadArmsImage() {

    var image = new Image();
    $(image).load(armsImgLoaded);
    image.src = 'images/index/grb.gif';
}

window.mapOptions;
window.latlng;

function preload() {
    
    window.latlng = new google.maps.LatLng(42.639523, 18.110286);
    
    var mapLatLng = new google.maps.LatLng(42.640600, 18.110286);

    window.mapOptions = {
        center: mapLatLng,
        zoom: 16,
        disableDefaultUI: true,
        zoomControl: true,
        mapTypeControl: true,
        zoomControlOptions: {
            style: google.maps.ZoomControlStyle.LARGE,
            position: google.maps.ControlPosition.LEFT_CENTER
        },
        mapTypeId: google.maps.MapTypeId.HYBRID
    };

    setLang();

    window.imageFilesArr = new Array();
    window.imagesLoaded = 0;
    window.loading = true;
    window.slideShowFlag = true;
    
    // WARNING!!
    // I know this can and should be loops, but the original idea was to put it all 
    // into configuration files.
    // As the project was abandoned by the client, that logic was never implemented.

    //index
    window.imageFilesArr.push("images/index/indexImg0.jpg");
    window.imageFilesArr.push("images/index/indexImg1.jpg");
    window.imageFilesArr.push("images/index/indexImg2.jpg");
    window.imageFilesArr.push("images/index/indexImg3.jpg");
    window.imageFilesArr.push("images/index/indexImg4.jpg");
    window.imageFilesArr.push("images/index/indexImg5.jpg");
    window.imageFilesArr.push("images/index/indexImg6.jpg");
    window.imageFilesArr.push("images/index/indexImg7.jpg");
    window.imageFilesArr.push("images/index/indexUp.jpg");
    window.imageFilesArr.push("images/index/indexImg0.jpg");
    window.imageFilesArr.push("images/index/indexDown3.jpg");

    //system
    window.imageFilesArr.push("images/system/button.png");
    window.imageFilesArr.push("images/system/buttonSel.png");
    window.imageFilesArr.push("images/system/button.gif");
    window.imageFilesArr.push("images/system/buttonSel.gif");

    //apartment
    window.imageFilesArr.push("images/apartment/apartmentBack.png");
    window.imageFilesArr.push("images/apartment/top0.png");
    window.imageFilesArr.push("images/apartment/top1.png");
    window.imageFilesArr.push("images/apartment/top2.png");
    window.imageFilesArr.push("images/apartment/top3.png");

    //gallery - controls
    window.imageFilesArr.push("images/gallery/controls/ajaxload.gif");
    window.imageFilesArr.push("images/gallery/controls/left.gif");
    window.imageFilesArr.push("images/gallery/controls/right.gif");
    window.imageFilesArr.push("images/gallery/controls/play.gif");
    window.imageFilesArr.push("images/gallery/controls/pause.gif");
    window.imageFilesArr.push("images/gallery/controls/play.gif");
    window.imageFilesArr.push("images/gallery/controls/pause.gif");

    //gallery - big images
    window.imageFilesArr.push("images/gallery/bigImages/imgB00.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB01.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB02.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB03.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB04.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB05.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB06.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB07.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB08.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB09.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB10.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB11.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB12.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB13.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB14.jpg");
    window.imageFilesArr.push("images/gallery/bigImages/imgB15.jpg");

    //gallery - small images
    window.imageFilesArr.push("images/gallery/smallImages/imgS00.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS01.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS02.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS03.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS04.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS05.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS06.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS07.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS08.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS09.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS10.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS11.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS12.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS13.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS14.jpg");
    window.imageFilesArr.push("images/gallery/smallImages/imgS15.jpg");

    loadArmsImage();
}

/****************************************************************/