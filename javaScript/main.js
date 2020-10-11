/**
 * index.js
 * 
 * Created by Marko Cetinić
 * 
 * Free fall all :)
 */

/****************************************************************/

function clearAllControls() {

    $('#controls, #langs').fadeOut("slow");

    //datePicker.js
    setCallendarNotLoading();

    window.lastTopImg = -100;

    window.play = false;
    window.imgSeq = 0;

    //gallery.js
    galleryInitVals();

    $('#apartmentBtn').removeClass('mainBtnSelected');
    $('#locationBtn').removeClass('mainBtnSelected');
    $('#facilitiesBtn').removeClass('mainBtnSelected');
    $('#galleryBtn').removeClass('mainBtnSelected');
    $('#checkBtn').removeClass('mainBtnSelected');
}

function beforeChangeScreen() {

    hideMap();

    $('#controls, #langs').fadeOut("slow");

    window.loading = true;

    clearAllControls();
}

function loadingCicle() {

    if (!window.loading)
    {
        $("#controls, #mainWindow").fadeIn("slow", function() {
            $("#loadingContaier, #arms, #loadingArms").stop().fadeOut("fast");
        });
    }
    else
        $("#loadingContaier, #arms, #loadingArms").fadeIn("slow").fadeOut('slow', function() {
            if (window.loading)
                loadingCicle();
            else
            {
                $('#controls, #langs, #mainWindow').fadeIn("slow", function() {
                    $("#loadingContaier, #arms, #loadingArms").stop().fadeOut("fast");
                });
            }
        });
}

/****************************************************************/

/****************************************************************/

function galleryLoaded() {

    $('#mainWindow').css('border', 'none');

    $('#galleryBtn').addClass('mainBtnSelected');

    stopLoading();
}

function showGallery() {


    if ($(this).hasClass('mainBtnSelected') || window.popUp !== null)
        return;

    beforeChangeScreen();

    $("#mainWindow").fadeOut("slow", function() {
        callAjaxLoad('ajax/gallery.tpl', '#mainWindow', null, loadingCicle, galleryLoaded);
    });
}

/****************************************************************/

/****************************************************************/

function showMap()
{
    $("#mapCanvas").css('top', '400px');
    $("#mapLink").css('top', '650px');

    $("#mapCanvas, #mapLink").css('visibility', 'visible').animate({opacity: "1"}, 1100);
}

function hideMap()
{
    $("#mapCanvas, #mapLink").animate({opacity: "0"}, 800, function()
    {
        $("#mapCanvas").css('top', '-1400px');
        $("#mapLink").css('top', '-1650px');

        $(this).css('visibility', 'visible');
    });
}

function locationLoaded() {

    $("#mainWindow").css('width', '870').css('height', '620').css('border', 'solid 3px white');

    $('#locationBtn').addClass('mainBtnSelected');

    stopLoading();

    setTimeout("showMap()", 1000);
}

function showLocation() {

    if ($(this).hasClass('mainBtnSelected') || window.popUp !== null)
        return;

    beforeChangeScreen();

    $("#mainWindow").fadeOut("slow", function() {
        callAjaxLoad('ajax/location.tpl', '#mainWindow', null, loadingCicle, locationLoaded);
    });
}

/****************************************************************/

/****************************************************************/

function facilitiesLoaded() {

    $("#mainWindow").css('width', '870').css('height', '620').css('border', 'solid 3px white');

    $('#facilitiesBtn').addClass('mainBtnSelected');

    stopLoading();
}

function facilitiesBtn() {
    
    if ($(this).hasClass('mainBtnSelected') || window.popUp !== null)
        return;

    beforeChangeScreen();

    $("#mainWindow").fadeOut("slow", function() {
        callAjaxLoad('ajax/facilities.tpl', '#mainWindow', null, loadingCicle, facilitiesLoaded);
    });
    
}

/****************************************************************/

/****************************************************************/

function apartmentLoaded() {

    $("#mainWindow").css('width', '870').css('height', '620').css('border', 'solid 3px white');

    $('#apartmentBtn').addClass('mainBtnSelected');

    stopLoading();

    setTimeout("topSlidShow()", 1500);
}

function showApartment() {

    if (window.slideShowFlag === false)
        if ($(this).hasClass('mainBtnSelected') || window.popUp !== null)
            return;

    window.slideShowFlag = false;

    beforeChangeScreen();

    window.lastTopImg = 1;

    $("#mainWindow").fadeOut("slow", function() {
        callAjaxLoad('ajax/main.tpl', '#mainWindow', null, loadingCicle, apartmentLoaded);
    });
}

$('#engLangBtn').live('click', function() {

    window.lang = 'en';
    showApartment();
});
$('#hrvLangBtn').live('click', function() {

    window.lang = 'hr';
    showApartment();
});

/****************************************************************/

/****************************************************************/

function datePickerLoaded() {

    $('#mainWindow').css('width', '1025px').css('border', 'solid 3px white');

    $('#checkBtn').addClass('mainBtnSelected');

    stopLoading();
}

function showDatePicker() {

    if ($(this).hasClass('mainBtnSelected') || window.popUp !== null)
        return;

    beforeChangeScreen();

    var currYear = new Date().getFullYear().toString();

    var data = {
        year: currYear
    };

    $("#mainWindow").fadeOut("slow", function() {
        callAjaxLoad('data/datePicker.php', '#mainWindow', data, loadingCicle, datePickerLoaded);
    });
}

/****************************************************************/

/****************************************************************/

$('#galleryBtn').live('click', showGallery);
$('#locationBtn').live('click', showLocation);
$('#facilitiesBtn').live('click', facilitiesBtn);
$('#apartmentBtn').live('click', showApartment);
$('#checkBtn').live('click', showDatePicker);

/****************************************************************/