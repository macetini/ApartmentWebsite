/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 * index.js
 * 
 */

window.lang = "en";

function loadBundles(lang) {

    jQuery.i18n.properties({
        name: 'locales',
        path: 'bundle/',
        mode: 'both',
        language: lang,
        callback: function() {
            updatePage();
        }
    });
}

function updatePage() {

    $("span, p, a, input, h1, h2").each(function() {

        if (this.id !== '')
        {
            var id = this.id;
            var idStr = "#" + id;

            var str = jQuery.i18n.prop(id);

            var match = false;

            if (str.substring(1, str.length - 1) === id)
                return;

            var tagName = $(idStr).get(0).tagName;

            if (tagName === undefined)
                return;

            switch (tagName)
            {
                case "A":
                    $(idStr).text(str);
                    break;
                case "INPUT":
                    if ($(idStr).attr("value") !== "button")
                        $(idStr).attr("value", str);
                    break;
                default:
                    $(idStr).html(str);
                    break;
            }
        }
    });
}

function setLang()
{
    loadBundles(window.lang);

    switch (window.lang)
    {
        case 'en':
            $('#hr').removeClass('selectedLang');
            break;
        case 'hr':
            $('#en').removeClass('selectedLang');
            break;
    }

    $('#' + window.lang).addClass('selectedLang');
}

$('.langButton').live('click', function() {

    window.lang = $(this).attr('id');

    setLang();
});
