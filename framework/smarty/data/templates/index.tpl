<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" class="gradient">

    <head>

        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=yes" />

        <title>Danica Apartments</title>

        <link rel="stylesheet" href="css/index.css"></link>

        <link rel="stylesheet" href="css/main.css"></link>

        <link rel="stylesheet" href="css/location.css"></link>

        <link rel="stylesheet" href="css/facilities.css"></link>

        <link rel="stylesheet" href="css/gallery.css"/>

        <!--[if gte IE 9]>
                <link rel="stylesheet" href="css/ie9Gte.css"></link>
        <![endif]-->

        <link rel="stylesheet" href="css/datePicker.css"></link>

        <link rel="stylesheet" href="css/reservePopUp.css"></link>

        <link rel="stylesheet" href="css/gallery.css"></link>

        <link rel="stylesheet" href="css/galleryPopUp.css"></link>

        <script type="text/javascript" src="framework/jQuery/jquery_dev.js"></script>

        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

        <script type="text/javascript" src="framework/j18n/jquery.i18n.properties.js"></script>

        <script type="text/javascript" src="javaScript/multyLanguage.js"></script>

        <script type="text/javascript" src="javaScript/preload.js"></script>

        <script type="text/javascript" src="javaScript/main.js"></script>

        <script type="text/javascript" src="javaScript/apartment.js"></script>

        <script type="text/javascript" src="javaScript/gallery/gallery.js"></script>

        <script type="text/javascript" src="javaScript/gallery/galleryPopUp.js"></script>

        <script type="text/javascript" src="javaScript/datePicker/priceCalculation.js"></script>
        <script type="text/javascript" src="javaScript/datePicker/dateUtils.js"></script>
        <script type="text/javascript" src="javaScript/datePicker/datePicker.js"></script>
        <script type="text/javascript" src="javaScript/datePicker/reservePopUp.js"></script>

        <script type="text/javascript" src="javaScript/index.js"></script>

    </head>

    <body>

        <div id="langs">
            <div id="en" class="langButton selectedLang">EN</div>
            <div id="hr" class="langButton">HR</div>
        </div>

        <div id="loadingContaier">
            <div id="loading" class="loading">
                <span id="loadingPercent" class="loadingText"> </span> <span class="loadingText" id="loadingTxt"></span>
            </div>

            <div id="loadingArms">
                <img id="arms" src="images/index/grb.gif" class="hide loading"/>
            </div>
        </div>

        <div id="mainWindow">
        </div>

        <div id="controls">
            <div id="apartmentBtn" class="mainBtn mainBtnSelected"><span id="apartmentBtnTxt" class="mainBtnTxt"></span></div>
            <div id="locationBtn" class="mainBtn"><span id="locationBtnTxt" class="mainBtnTxt"></span></div>
            <div id="facilitiesBtn" class="mainBtn"><span id="facilitiesBtnTxt" class="mainBtnTxt"></span></div>
            <div id="galleryBtn" class="mainBtn"><span id="galleryBtnTxt" class="mainBtnTxt"></span></div>
            <div id="checkBtn" class="mainBtn"><span id="checkBtnTxt" class="mainBtnTxt"></span></div>
        </div>

        <div id="mapCanvas"></div>
        <a id="mapLink" target="_blank" href="http://maps.google.com/maps?q=Dubrovnik,+Stulina+2&hl=en&ie=UTF8&ll=42.640928,18.109782&spn=0.006409,0.009645&sll=42.948381,18.500977&sspn=3.264846,4.938354&hnear=Stulina+ulica+2,+20000,+Dubrova%C4%8Dko-neretvanska+%C5%BEupanija,+Croatia&t=h&z=17">
            <span id="linkToMap"></span>
        </a>

    </body>

</html>
