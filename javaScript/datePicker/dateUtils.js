function setDateInActive(day)
{
    var dayId = "#" + day;

    if ($(dayId).hasClass('disabledElement'))
        $(dayId).css("opacity", 0.4);

    $(dayId).css("background-color", window.DARK_BLUE_COLOR);
    $(dayId).css("color", window.WHITE_COLOR);
}

function setDateActive(day)
{
    var dayId = "#" + day;

    if ($(dayId).hasClass('disabledElement'))
    {
        $(dayId).css("opacity", 0.7);
        $(dayId).css("background-color", window.RED_COLOR);
    } else
    {
        $(dayId).css("background-color", window.LIGHT_SKY_BLUE_COLOR);
    }

    $(dayId).css("color", window.DARK_BLUE_COLOR);
}

function setDateOneOfActive(day)
{
    var dayId = "#" + day;

    $(dayId).css("background-color", window.LIGHT_SKY_BLUE_COLOR);
    $(dayId).css("color", window.DARK_BLUE_COLOR);
}

function setAllMonthsDeactive()
{
    for (var i = 0; i < 13; i++)
    {
        var bgColor = window.DARK_BLUE_COLOR;
        var color = window.WHITE_COLOR;

        $("#monthNumb" + i).css("background-color", bgColor);
        $("#monthNumbSpan" + i).css("color", color);

        $("#monthName" + i).css("background-color", bgColor);
        $("#monthNameSpan" + i).css("color", color);

        $("#price" + i).css("background-color", bgColor);
        $("#priceSpan" + i).css("color", color);
    }
}

function arrDiff(a1, a2)
{
    diff = new Array;

    var found;
    for (var i = 0; i < a2.length; i++)
    {
        found = false;

        for (var j = 0; j < a1.length; j++)
        {
            if (a2[i] === a1[j])
            {
                found = true;
                break;
            }
        }

        if (!found)
            diff.push(a2[i]);
    }

    return diff;
}

function clearOuterDates(firstDate, secondDate)
{
    var diff = arrDiff(firstDate, secondDate);

    if (diff.length > 0)
    {
        for (var i = 0; i < diff.length; i++)
        {
            setDateInActive(diff[i]);
        }
    }
}