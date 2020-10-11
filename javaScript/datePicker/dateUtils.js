function zeroPad(num) {
    
    var zero = 2 - num.toString().length + 1;
    
    return Array(zero > 0 && zero).join("0") + num;
}

function setDateInActive(dayId)
{
     if($("#"+dayId).hasClass('disabledDay'))
        $("#" + dayId).css("opacity", 0.4);
    
    $("#" + dayId).css("background-color", window.DARK_BLUE_COLOR);
    $("#" + dayId).css("color", window.WHITE_COLOR);
}

function setDateActive(dayId)
{
    if($("#"+dayId).hasClass('disabledDay'))
    {
        $("#" + dayId).css("opacity", 0.7);
        $("#" + dayId).css("background-color", window.RED_COLOR);
    }
    else
        $("#" + dayId).css("background-color", window.LIGHT_SKY_BLUE_COLOR);
        
    $("#" + dayId).css("color", window.DARK_BLUE_COLOR);
}

function setDateOneOfActive(dayId)
{
    $("#" + dayId).css("background-color", window.LIGHT_SKY_BLUE_COLOR);
    $("#" + dayId).css("color", window.DARK_BLUE_COLOR);
}

function convertDateStrToDateObj(dateStr)
{
    var dateStrArr = new Array(3);
    
    dateStrArr[0] =  dateStr.substring(0, 4);

    dateStrArr[1] = dateStr.substring(4, 6);
    
    dateStrArr[2] = dateStr.substring(6, 8);
        
    var date = new Date(dateStrArr[0], dateStrArr[1], dateStrArr[2]);
    
    return date;
}

function arrDiff(a1, a2)
{
    diff= new Array;
    
    var found;
    
    for(var i=0; i<a2.length; i++)
    {
        found = false;
        
        for(var j=0; j<a1.length; j++)
            if(a2[i] === a1[j])
            {
                found = true;
                break;
            }
            
        if(!found)
            diff.push(a2[i]);
    }
    
    return diff;
}

function clearOuterDates(firstDate, secondDate)
{
    var diff = arrDiff(firstDate, secondDate);
    
    if(diff.length > 0)
        for(var i=0; i < diff.length; i++)
            setDateInActive(diff[i]);
}