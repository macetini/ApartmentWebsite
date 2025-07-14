function calculateStats(currentDates)
{
    if (currentDates.length > 1)
    {
        currentDates = currentDates.slice(0, currentDates.length - 1);
    }

    var numOfNights = currentDates.length;

    $("#numOfNights").html((numOfNights).toString());

    var totalPrice = 0;
    var pricePerNight = 0;

    for (var i in currentDates)
    {
        pricePerNight = parseInt($("#price_" + currentDates[i]).val());
        totalPrice += pricePerNight;
    }
    
    $("#totalPrice").html(totalPrice + " \u20ac");
}