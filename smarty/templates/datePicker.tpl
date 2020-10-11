<br />

<div id="datePicker">

    <div id="infoContainer">
        <span class="infoElem" id="yearSelectInfo"></span>
        <span class="infoElem" id="dayTypeInfo"></span>
    </div>

    <br/>

    <div id="selectYear">

        <span class="selYearElem {if $currYear eq $smarty.now|date_format:'%Y'}activeYear{else}inctiveYear{/if}" id="thisYear">
            {if $currYear eq $smarty.now|date_format:'%Y'}
                {$currYear}
            {else}
                {$previousYear}
            {/if}
        </span>&nbsp;
        <span class="selYearElem {if $currYear neq $smarty.now|date_format:'%Y'}activeYear{else}inctiveYear{/if}" id="nextYear">
            {if $currYear eq $smarty.now|date_format:'%Y'}
                {$nextYear}
            {else}
                {$currYear}
            {/if}
        </span>

        <span id="spacer" />

        <span id="legendDay" class="legendElem">1</span>
        <span id="dayInfo"></span>

        &nbsp;

        <span  id="legendDisabledDay" class="legendElem">1</span>
        <span id="pastBookedDayInfo"></span>

        &nbsp;

        <span id="legendCheckInDay" class="legendElem">1</span>
        <span id="legendCheckInDayInfo"></span>

        &nbsp;

        <span id="legendMonth" class="legendElem"></span>
        <span id="ppnInfo"></span>

    </div>

    <div id="datePicker">

        {foreach from=$daysPerMounth name=feach item=dpm key=month}

            <div id="left" class="calendarContainer">
                {section name=dpm start=0 max=$dpm/2|ceil loop=$dpm step=1}

                    {assign var="dayId" value=$smarty.section.dpm.index+1|string_format:'%02d'}
                    {assign var="monthId" value=$smarty.foreach.feach.index|string_format:'%02d'}

                    {if $smarty.foreach.feach.index neq 12}
                        {assign var="dateId" value=$currYear|cat:$monthId|cat:$dayId}
                    {else}
                        {assign var="dateId" value=$nextYear|cat:"00"|cat:$dayId}
                    {/if}

                    <span id="{$dateId}" class="day calendarElement {if $currDate > $dateId || $dateId|in_array:$bookedDates}disabledDay{/if}">{$smarty.section.dpm.index+1}</span>
                {/section}
            </div>

            <div class="calendarContainer calendarElement monthNum {if $smarty.foreach.feach.index+1 < $smarty.now|date_format:"%m" and $currYear eq $smarty.now|date_format:'%Y'}disabledDay{/if}" id="monthNumb{$smarty.foreach.feach.index}">
                <span class="monthLabel" id="monthNumbSpan{$smarty.foreach.feach.index}">
                    {if $smarty.foreach.feach.index < 12}
                        {$smarty.foreach.feach.index+1} - 
                    {else}
                        1 -
                    {/if}
                </span>
            </div>

            <div class="calendarContainer calendarElement monthName {if $smarty.foreach.feach.index+1 < $smarty.now|date_format:"%m" and $currYear eq $smarty.now|date_format:'%Y'}disabledDay{/if}" id="monthName{$smarty.foreach.feach.index}">
                <span class="monthLabel" id="monthNameSpan{$smarty.foreach.feach.index}">{$month}</span>
            </div>

            <div class="calendarContainer calendarElement price {if $smarty.foreach.feach.index+1 < $smarty.now|date_format:"%m" and $currYear eq $smarty.now|date_format:'%Y'}disabledDay{/if}" id="price{$smarty.foreach.feach.index}">
                <span class="monthLabel" id="priceSpan{$smarty.foreach.feach.index}"> - {$pricePerMonth[$smarty.foreach.feach.index]} €</span>
            </div>

            <div class="calendarContainer">
                {section name=dpm2 start=$smarty.section.dpm.index loop=$dpm step=1}

                    {assign var="dayId" value=$smarty.section.dpm2.index+1|string_format:'%02d'}
                    {assign var="monthId" value=$smarty.foreach.feach.index|string_format:'%02d'}

                    {if $smarty.foreach.feach.index neq 12}
                        {assign var="dateId" value=$currYear|cat:$monthId|cat:$dayId}
                    {else}
                        {assign var="dateId" value=$nextYear|cat:"00"|cat:$dayId}
                    {/if}

                    <span id="{$dateId}" class="day calendarElement {if $currDate > $dateId || $dateId|in_array:$bookedDates}disabledDay{/if}">{$smarty.section.dpm2.index+1}</span>
                {/section}
            </div>

        {/foreach}

    </div>

    {foreach from=$pricesPerDay item=price}

        <input type="hidden" value="{$price[1]}" id="price{$price[0]}" />

    {/foreach}

    <div id="priceInfo">
        <br />
        <span>
            <span class="priceInfo" id="priceInfoP1"></span>{$currYear} 
            <span class="priceInfo" id="priceInfoP2"></span>{$currYear}
            <span class="priceInfo" id="priceInfoP3"></span>{$currYear}
            <span class="priceInfo" id="priceInfoP4"></span>{$nextYear}
            <span class="priceInfo" id="priceInfoP5"></span> {$addPrice}
            <span class="priceInfo" id="priceInfoP6"></span>
        </span>
    </div>

    <br /><br />

    <div id="stats">
        <span id="nonTxt"></span><span id="numOfNights"> 0</span>

        <br />

        <span id="totalPriceTxt"></span><span id="totalPrice"> 0 €</span>
    </div>

    <div id="reserveBtnCont">
        <span id="reserveBtn" class="disabledDay"></span>
    </div>

    <img src="images/system/ajax-loader.gif" id="loadGif" class="notLoadingImg" />

</div>