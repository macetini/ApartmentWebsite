<br />

<div id="datePicker">

    <div id="infoContainer">
        <span class="infoElem" id="yearSelectInfo"></span>
        <span class="infoElem" id="dayTypeInfo"></span>
    </div>

    <br/>

    <div id="selectYear">

        <span class="selYearElem {if $currentYear eq $smarty.now|date_format:'%Y'}activeYear{else}inctiveYear{/if}" id="thisYear">
            {if $currentYear eq $smarty.now|date_format:'%Y'}
                {$currentYear}
            {else}
                {$previousYear}
            {/if}
        </span>&nbsp;
        <span class="selYearElem {if $currentYear neq $smarty.now|date_format:'%Y'}activeYear{else}inctiveYear{/if}" id="nextYear">
            {if $currentYear eq $smarty.now|date_format:'%Y'}
                {$nextYear}
            {else}
                {$currentYear}
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
        
     <div>
        
        {foreach from=$yearTimeStamps name=months key=monthKey item=monthTimeStamps}

            <div id="left" class="calendarContainer">                
                {section name=leftDayTimeStamps loop=$monthTimeStamps start=0 max=$monthTimeStamps|count/2|ceil step=1}
                    {assign var="dayTimeStamp" value=$monthTimeStamps[$smarty.section.leftDayTimeStamps.index]}
                    <span id="{$dayTimeStamp}" 
                          class="day calendarElement
                          {if $smarty.now > $dayTimeStamp || $dayTimeStamp|in_array:$bookedDates}disabledDay{/if}">
                        {$smarty.section.leftDayTimeStamps.index+1}
                    </span>
                {/section}
            </div>
            
            <div class="calendarContainer calendarElement monthNum
                 {if $smarty.foreach.months.index+1 < $smarty.now|date_format:"%m" and $currentYear eq $smarty.now|date_format:'%Y'}disabledDay{/if}"
                 id="monthNumb{$smarty.foreach.months.index}">
                <span class="monthLabel" id="monthNumbSpan{$smarty.foreach.months.index}">
                    {if $smarty.foreach.months.index <= 12}
                        {$smarty.foreach.months.index} - 
                    {else}
                            1 -
                    {/if}
                </span>
            </div>
                
            <div class="calendarContainer calendarElement monthName
                 {if $smarty.foreach.months.index+1 < $smarty.now|date_format:"%m" and $currentYear eq $smarty.now|date_format:'%Y'}disabledDay{/if}"
                 id="monthName{$smarty.foreach.months.index}">
                <span class="monthLabel" id="monthNameSpan{$smarty.foreach.months.index}"></span>
            </div>

            <div class="calendarContainer calendarElement price
                 {if $smarty.foreach.months.index+1 < $smarty.now|date_format:"%m" and $currentYear eq $smarty.now|date_format:'%Y'}disabledDay{/if}"
                 id="price{$smarty.foreach.months.index}">
                <span class="monthLabel" id="priceSpan{$smarty.foreach.months.index}"> - {$pricePerMonth[$smarty.foreach.months.index]} €</span>
            </div>
            
            <div class="calendarContainer">
                {assign var="startIndex" value=$monthTimeStamps|count/2|ceil}
                {section name=rightDayTimeStamps loop=$monthTimeStamps start=$startIndex step=1}
                    {assign var="dayTimeStamp" value=$monthTimeStamps[$smarty.section.rightDayTimeStamps.index]}
                    <span id="{$dayTimeStamp}"
                          class="day calendarElement
                          {if $smarty.now > $dayTimeStamp || $dayTimeStamp|in_array:$bookedDates}disabledDay{/if}">
                        {$smarty.section.rightDayTimeStamps.index+1}
                    </span>
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
            <span class="priceInfo" id="priceInfoP1"></span>{$currentYear} 
            <span class="priceInfo" id="priceInfoP2"></span>{$currentYear}
            <span class="priceInfo" id="priceInfoP3"></span>{$currentYear}
            <span class="priceInfo" id="priceInfoP4"></span>{$currentYear}
            <span class="priceInfo" id="priceInfoP5"></span> {$currentYear}
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