/**
 * datePicker.js
 * 
 * Created by Marko Cetinić
 * 
 * Free for all :)
 */

const DATE_SELECTED_NONE = 0;
const DATE_SELECTED_FIRST = 1;
const DATE_SELECTED_SECOND = 2;

window.mode = DATE_SELECTED_NONE;

window.startDate = undefined;
window.endDate = undefined;

window.invalidDate = false;

window.currentDates = new Array;

window.WHITE_COLOR = "white";
window.RED_COLOR = "red";
window.DARK_BLUE_COLOR = "#193969";
window.LIGHT_SKY_BLUE_COLOR = "#A4D3EE";

function markYearSelection(selectedYear, oldSelectedYear)
{
    $(selectedYear).removeClass('inctiveYear');
    $(selectedYear).addClass('activeYear');

    $(oldSelectedYear).removeClass('activeYear');
    $(oldSelectedYear).addClass('inctiveYear');
}

function setInitMode()
{
    window.mode = DATE_SELECTED_NONE;

    window.startDate = undefined;
    window.endDate = undefined;

    window.invalidDate = false;
    window.currentDates = new Array();
}

function setCallendarLoading()
{
    $('#loadGif').removeClass("notLoadingImg");
    $('#mainWindow').addClass("yearChangeLoading");
}

function setCallendarNotLoading()
{
    $('#loadGif').addClass("notLoadingImg");
    $('#mainWindow').removeClass("yearChangeLoading");
}

function calendarLoaded()
{
    setCallendarNotLoading();
    setInitMode();
}

$('#thisYear').live("click", function ()
{
    if ($(this).hasClass('activeYear') || $('#mainWindow').hasClass('yearChangeLoading') || window.popUp)
        return;

    markYearSelection('#thisYear', '#nextYear');
    setCallendarLoading();

    var currentYear = new Date().getFullYear().toString();
    var data = {year: currentYear};

    callAjaxLoad('data/datePicker.php', '#mainWindow', data, null, calendarLoaded);
});

$('#nextYear').live("click", function ()
{
    if ($(this).hasClass('activeYear') || $('#mainWindow').hasClass('yearChangeLoading') || window.popUp) {
        return;
    }

    markYearSelection('#nextYear', '#thisYear');
    setCallendarLoading();

    var nexYear = (new Date().getFullYear() + 1).toString();
    var data = {year: nexYear};

    callAjaxLoad('data/datePicker.php', '#mainWindow', data, null, calendarLoaded);
});

function markMonthAndPriceActive()
{
    var centerElems = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    var selectedYear = parseInt($('.activeYear').text());

    for (var i = 0; i < window.currentDates.length; i++)
    {
        var currentDate = window.currentDates[i];
        var currentDateObj = new Date(currentDate * 1000);

        var month = parseInt(currentDateObj.getMonth());
        var year = parseInt(currentDateObj.getFullYear());

        var currentDateId = "#" + currentDate;
        if (year === selectedYear)
        {
            if ($(currentDateId).hasClass('disabledElement'))
            {
                centerElems[month] = 2;
            } else if (centerElems[month] !== 2) {
                centerElems[month] = 1;
            }
        } else {
            if ($(currentDateId).hasClass('disabledElement'))
            {
                centerElems[12] = 2;
            } else
            {
                if (centerElems[12] !== 2)
                {
                    centerElems[12] = 1;
                }
            }
        }

        var bgColor;
        var color;

        for (var j = 0; j < centerElems.length; j++)
        {
            switch (centerElems[j])
            {
                case 0:
                    bgColor = window.DARK_BLUE_COLOR;
                    color = window.WHITE_COLOR;
                    break;
                case 1:
                    bgColor = window.WHITE_COLOR;
                    color = window.DARK_BLUE_COLOR;
                    break;
                case 2:
                    bgColor = window.RED_COLOR;
                    color = window.DARK_BLUE_COLOR;
                    break;
            }

            $("#monthNumb" + j).css("background-color", bgColor);
            $("#monthNumbSpan" + j).css("color", color);

            $("#monthName" + j).css("background-color", bgColor);
            $("#monthNameSpan" + j).css("color", color);

            $("#price" + j).css("background-color", bgColor);
            $("#priceSpan" + j).css("color", color);
        }
    }
}

function markAllDaysBetweenTwoDates(startDate, endDate, bgColor, color) {
    if (bgColor === undefined)
    {
        bgColor = window.WHITE_COLOR;
    }
    if (color === undefined)
    {
        color = window.DARK_BLUE_COLOR;
    }

    var newCurrentDates = new Array();

    if (startDate >= endDate)
    {
        setDateOneOfActive(startDate);
        newCurrentDates.push(startDate);

        return newCurrentDates;
    }

    newCurrentDates.push(startDate);

    window.invalidDate = false;

    do {
        if (startDate !== window.startDate && startDate !== window.endDate)
        {
            var startDateId = "#" + startDate;
            if ($(startDateId).hasClass('disabledElement'))
            {
                window.invalidDate = true;

                $(startDateId).css("opacity", 0.7);
                $(startDateId).css("background-color", window.RED_COLOR);
            } else
            {
                $(startDateId).css("background-color", bgColor);
            }
            $(startDateId).css("color", color);

            newCurrentDates.push(startDate);
        }
        var startDateObj = new Date(startDate * 1000);
        startDateObj.setDate(startDateObj.getDate() + 1);
        startDate = parseInt(startDateObj.getTime() / 1000);
    } while (startDate <= endDate);

    return newCurrentDates;
}

function clearAllDates()
{
    $('#reserveBtn').addClass('disabledElement');

    var currentYear = parseInt(($('.activeYear').text()));
    var nextYear = currentYear + 1;

    var startDate = new Date(currentYear, 0, 1);
    var endDate = new Date(nextYear, 1, 31);

    do {
        var dateId = "#" + parseInt(startDate.getTime() / 1000);
        $(dateId).css("background-color", window.DARK_BLUE_COLOR);
        $(dateId).css("color", window.WHITE_COLOR);

        startDate.setDate(startDate.getDate() + 1);
    } while (startDate <= endDate);
}

$(".day").live("mouseover", function () {
    if ($('#mainWindow').hasClass('yearChangeLoading') || window.popUp) {
        return;
    }

    var hoveredDate = parseInt(this.id);

    if (window.mode === DATE_SELECTED_NONE)
    {
        for (var i = 0; i < window.currentDates.length; i++)
        {
            if (window.currentDates[i] === hoveredDate)
            {
                return;
            }
        }
        setDateActive(hoveredDate);

    } else if (window.mode === DATE_SELECTED_FIRST) {
        var newDates = markAllDaysBetweenTwoDates(window.startDate, hoveredDate);

        clearOuterDates(newDates, window.currentDates);

        window.currentDates = newDates;

        markMonthAndPriceActive();
        calculateStats(window.currentDates);
    }
});

$(".day").live("mouseleave", function ()
{
    if ($('#mainWindow').hasClass('yearChangeLoading') || window.popUp) {
        return;
    }

    var hoveredDate = parseInt(this.id);

    if (window.mode === DATE_SELECTED_NONE)
    {
        for (var i = 0; i < window.currentDates.length; i++)
        {
            if (window.currentDates[i] === clickedDate)
            {
                return;
            }
        }
        setDateInActive(hoveredDate);
    }
});

function setFirstDate(clickedDate)
{
    window.invalidDate = false;

    window.currentDates = new Array;
    window.currentDates.push(clickedDate);

    window.startDate = clickedDate;
    window.endDate = undefined;

    window.mode = DATE_SELECTED_FIRST;
}

function setSecondDate(clickedDate)
{
    window.endDate = clickedDate;

    window.mode = DATE_SELECTED_SECOND;
}

function setNoDatesSelected()
{
    window.invalidDate = false;

    window.currentDates = new Array;

    window.startDate = undefined;
    window.endDate = undefined;

    window.mode = DATE_SELECTED_NONE;
}

$(".day").live("click", function () {
    if ($(this).hasClass('disabledElement') || $('#mainWindow').hasClass('yearChangeLoading') || window.popUp)
    {
        return;
    }

    var clickedDate = parseInt(this.id);

    if (window.mode == DATE_SELECTED_NONE || window.mode == DATE_SELECTED_SECOND)
    {
        if (window.mode == DATE_SELECTED_SECOND)
        {
            clearAllDates();
        }

        setFirstDate(clickedDate);
    } else if (window.mode == DATE_SELECTED_FIRST)
    {
        if (window.invalidDate)
        {
            return;
        } else if (window.startDate === clickedDate)
        {
            clearAllDates();
            setAllMonthsDeactive();
            setNoDatesSelected();
        } else if (window.startDate > clickedDate) {
            clearAllDates();

            setFirstDate(clickedDate);

            markMonthAndPriceActive();
            setDateActive(clickedDate);
            calculateStats(window.currentDates);
        } else
        {
            setSecondDate(clickedDate);

            $('#reserveBtn').removeClass('disabledElement');
        }

    } else if (window.mode == DATE_SELECTED_SECOND)
    {
        clearAllDates();
        setNoDatesSelected();
    }

    calculateStats(window.currentDates);
    markMonthAndPriceActive();
    setDateActive(clickedDate);
});

$('#reserveBtn').live('click', function ()
{
    if ($(this).hasClass('disabledElement'))
    {
        return;
    }

    $.get("data/reservePopUp.php", function (data)
    {
        $('#datePicker').append('<div> </div>');

        window.popUp = $('#datePicker').children().last();
        window.popUp.addClass('popUpReserve').html(data);

        updatePage();
    });
}
);