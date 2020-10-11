/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function calculateStats(currentDates)
{
    if(currentDates.length > 1)
        currentDates = currentDates.slice(0, currentDates.length - 1);
    
    var numOfNights = currentDates.length;
    
    $("#numOfNights").html((numOfNights).toString());
    
    var totalPrice = 0;
    var pricePerNight = 0;
    
    for(i in currentDates)
    {
        pricePerNight = $("#price" + currentDates[i]).val();
        totalPrice += Number($("#price" + currentDates[i]).val(), 10);
    }
   
    $("#pricePerNight").html(pricePerNight + " \u20ac");
    $("#totalPrice").html(totalPrice + " \u20ac");
}