/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/****************************************************************/

$("#closeReservePopUp").live('click', function() {

    $(window.popUp).fadeOut('fast', function() {

        $(this).remove();

        window.popUp = null;
    });
});

$("#reservConfirm").live('click', function() {

   if($('#reservConfirm').hasClass('popUpConfirmDisabled'))
       return;
   
    $(window.popUp).fadeOut('fast', function() {

        $(this).remove();

        window.popUp = null;

        var alertTxt = jQuery.i18n.prop('reservationCompleate');

        alert(alertTxt);
    });
});

$('#fnameId, #lnameId, #emailId').live('keypress, change, input', function() {
    
    var fnameId = $('#fnameId').attr("value");
    var lnameId = $('#lnameId').attr("value");
    var emailId = $('#emailId').attr("value");
    
    if(fnameId !== '' && lnameId !== '' && emailId !== '')
        $('#reservConfirm').removeClass('popUpConfirmDisabled');
    else
        $('#reservConfirm').addClass('popUpConfirmDisabled');
});