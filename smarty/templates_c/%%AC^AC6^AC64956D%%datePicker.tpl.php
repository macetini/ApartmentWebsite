<?php /* Smarty version 2.6.26, created on 2013-05-06 01:03:05
         compiled from datePicker.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'datePicker.tpl', 14, false),array('modifier', 'ceil', 'datePicker.tpl', 56, false),array('modifier', 'string_format', 'datePicker.tpl', 58, false),array('modifier', 'cat', 'datePicker.tpl', 62, false),array('modifier', 'in_array', 'datePicker.tpl', 67, false),)), $this); ?>
<br />

<div id="datePicker">

    <div id="infoContainer">
        <span class="infoElem" id="yearSelectInfo"></span>
        <span class="infoElem" id="dayTypeInfo"></span>
    </div>

    <br/>

    <div id="selectYear">

        <span class="selYearElem <?php if ($this->_tpl_vars['currYear'] == ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y'))): ?>activeYear<?php else: ?>inctiveYear<?php endif; ?>" id="thisYear">
            <?php if ($this->_tpl_vars['currYear'] == ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y'))): ?>
                <?php echo $this->_tpl_vars['currYear']; ?>

            <?php else: ?>
                <?php echo $this->_tpl_vars['previousYear']; ?>

            <?php endif; ?>
        </span>&nbsp;
        <span class="selYearElem <?php if ($this->_tpl_vars['currYear'] != ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y'))): ?>activeYear<?php else: ?>inctiveYear<?php endif; ?>" id="nextYear">
            <?php if ($this->_tpl_vars['currYear'] == ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y'))): ?>
                <?php echo $this->_tpl_vars['nextYear']; ?>

            <?php else: ?>
                <?php echo $this->_tpl_vars['currYear']; ?>

            <?php endif; ?>
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

        <?php $_from = $this->_tpl_vars['daysPerMounth']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['feach'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['feach']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['month'] => $this->_tpl_vars['dpm']):
        $this->_foreach['feach']['iteration']++;
?>

            <div id="left" class="calendarContainer">
                <?php unset($this->_sections['dpm']);
$this->_sections['dpm']['name'] = 'dpm';
$this->_sections['dpm']['start'] = (int)0;
$this->_sections['dpm']['max'] = (int)((is_array($_tmp=$this->_tpl_vars['dpm']/2)) ? $this->_run_mod_handler('ceil', true, $_tmp) : ceil($_tmp));
$this->_sections['dpm']['loop'] = is_array($_loop=$this->_tpl_vars['dpm']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['dpm']['step'] = ((int)1) == 0 ? 1 : (int)1;
$this->_sections['dpm']['show'] = true;
if ($this->_sections['dpm']['max'] < 0)
    $this->_sections['dpm']['max'] = $this->_sections['dpm']['loop'];
if ($this->_sections['dpm']['start'] < 0)
    $this->_sections['dpm']['start'] = max($this->_sections['dpm']['step'] > 0 ? 0 : -1, $this->_sections['dpm']['loop'] + $this->_sections['dpm']['start']);
else
    $this->_sections['dpm']['start'] = min($this->_sections['dpm']['start'], $this->_sections['dpm']['step'] > 0 ? $this->_sections['dpm']['loop'] : $this->_sections['dpm']['loop']-1);
if ($this->_sections['dpm']['show']) {
    $this->_sections['dpm']['total'] = min(ceil(($this->_sections['dpm']['step'] > 0 ? $this->_sections['dpm']['loop'] - $this->_sections['dpm']['start'] : $this->_sections['dpm']['start']+1)/abs($this->_sections['dpm']['step'])), $this->_sections['dpm']['max']);
    if ($this->_sections['dpm']['total'] == 0)
        $this->_sections['dpm']['show'] = false;
} else
    $this->_sections['dpm']['total'] = 0;
if ($this->_sections['dpm']['show']):

            for ($this->_sections['dpm']['index'] = $this->_sections['dpm']['start'], $this->_sections['dpm']['iteration'] = 1;
                 $this->_sections['dpm']['iteration'] <= $this->_sections['dpm']['total'];
                 $this->_sections['dpm']['index'] += $this->_sections['dpm']['step'], $this->_sections['dpm']['iteration']++):
$this->_sections['dpm']['rownum'] = $this->_sections['dpm']['iteration'];
$this->_sections['dpm']['index_prev'] = $this->_sections['dpm']['index'] - $this->_sections['dpm']['step'];
$this->_sections['dpm']['index_next'] = $this->_sections['dpm']['index'] + $this->_sections['dpm']['step'];
$this->_sections['dpm']['first']      = ($this->_sections['dpm']['iteration'] == 1);
$this->_sections['dpm']['last']       = ($this->_sections['dpm']['iteration'] == $this->_sections['dpm']['total']);
?>

                    <?php $this->assign('dayId', ((is_array($_tmp=$this->_sections['dpm']['index']+1)) ? $this->_run_mod_handler('string_format', true, $_tmp, '%02d') : smarty_modifier_string_format($_tmp, '%02d'))); ?>
                    <?php $this->assign('monthId', ((is_array($_tmp=($this->_foreach['feach']['iteration']-1))) ? $this->_run_mod_handler('string_format', true, $_tmp, '%02d') : smarty_modifier_string_format($_tmp, '%02d'))); ?>

                    <?php if (($this->_foreach['feach']['iteration']-1) != 12): ?>
                        <?php $this->assign('dateId', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['currYear'])) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['monthId']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['monthId'])))) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['dayId']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['dayId']))); ?>
                    <?php else: ?>
                        <?php $this->assign('dateId', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['nextYear'])) ? $this->_run_mod_handler('cat', true, $_tmp, '00') : smarty_modifier_cat($_tmp, '00')))) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['dayId']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['dayId']))); ?>
                    <?php endif; ?>

                    <span id="<?php echo $this->_tpl_vars['dateId']; ?>
" class="day calendarElement <?php if ($this->_tpl_vars['currDate'] > $this->_tpl_vars['dateId'] || ((is_array($_tmp=$this->_tpl_vars['dateId'])) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['bookedDates']) : in_array($_tmp, $this->_tpl_vars['bookedDates']))): ?>disabledDay<?php endif; ?>"><?php echo $this->_sections['dpm']['index']+1; ?>
</span>
                <?php endfor; endif; ?>
            </div>

            <div class="calendarContainer calendarElement monthNum <?php if (($this->_foreach['feach']['iteration']-1)+1 < ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m") : smarty_modifier_date_format($_tmp, "%m")) && $this->_tpl_vars['currYear'] == ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y'))): ?>disabledDay<?php endif; ?>" id="monthNumb<?php echo ($this->_foreach['feach']['iteration']-1); ?>
">
                <span class="monthLabel" id="monthNumbSpan<?php echo ($this->_foreach['feach']['iteration']-1); ?>
">
                    <?php if (($this->_foreach['feach']['iteration']-1) < 12): ?>
                        <?php echo ($this->_foreach['feach']['iteration']-1)+1; ?>
 - 
                    <?php else: ?>
                        1 -
                    <?php endif; ?>
                </span>
            </div>

            <div class="calendarContainer calendarElement monthName <?php if (($this->_foreach['feach']['iteration']-1)+1 < ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m") : smarty_modifier_date_format($_tmp, "%m")) && $this->_tpl_vars['currYear'] == ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y'))): ?>disabledDay<?php endif; ?>" id="monthName<?php echo ($this->_foreach['feach']['iteration']-1); ?>
">
                <span class="monthLabel" id="monthNameSpan<?php echo ($this->_foreach['feach']['iteration']-1); ?>
"><?php echo $this->_tpl_vars['month']; ?>
</span>
            </div>

            <div class="calendarContainer calendarElement price <?php if (($this->_foreach['feach']['iteration']-1)+1 < ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m") : smarty_modifier_date_format($_tmp, "%m")) && $this->_tpl_vars['currYear'] == ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, '%Y') : smarty_modifier_date_format($_tmp, '%Y'))): ?>disabledDay<?php endif; ?>" id="price<?php echo ($this->_foreach['feach']['iteration']-1); ?>
">
                <span class="monthLabel" id="priceSpan<?php echo ($this->_foreach['feach']['iteration']-1); ?>
"> - <?php echo $this->_tpl_vars['pricePerMonth'][($this->_foreach['feach']['iteration']-1)]; ?>
 €</span>
            </div>

            <div class="calendarContainer">
                <?php unset($this->_sections['dpm2']);
$this->_sections['dpm2']['name'] = 'dpm2';
$this->_sections['dpm2']['start'] = (int)$this->_sections['dpm']['index'];
$this->_sections['dpm2']['loop'] = is_array($_loop=$this->_tpl_vars['dpm']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['dpm2']['step'] = ((int)1) == 0 ? 1 : (int)1;
$this->_sections['dpm2']['show'] = true;
$this->_sections['dpm2']['max'] = $this->_sections['dpm2']['loop'];
if ($this->_sections['dpm2']['start'] < 0)
    $this->_sections['dpm2']['start'] = max($this->_sections['dpm2']['step'] > 0 ? 0 : -1, $this->_sections['dpm2']['loop'] + $this->_sections['dpm2']['start']);
else
    $this->_sections['dpm2']['start'] = min($this->_sections['dpm2']['start'], $this->_sections['dpm2']['step'] > 0 ? $this->_sections['dpm2']['loop'] : $this->_sections['dpm2']['loop']-1);
if ($this->_sections['dpm2']['show']) {
    $this->_sections['dpm2']['total'] = min(ceil(($this->_sections['dpm2']['step'] > 0 ? $this->_sections['dpm2']['loop'] - $this->_sections['dpm2']['start'] : $this->_sections['dpm2']['start']+1)/abs($this->_sections['dpm2']['step'])), $this->_sections['dpm2']['max']);
    if ($this->_sections['dpm2']['total'] == 0)
        $this->_sections['dpm2']['show'] = false;
} else
    $this->_sections['dpm2']['total'] = 0;
if ($this->_sections['dpm2']['show']):

            for ($this->_sections['dpm2']['index'] = $this->_sections['dpm2']['start'], $this->_sections['dpm2']['iteration'] = 1;
                 $this->_sections['dpm2']['iteration'] <= $this->_sections['dpm2']['total'];
                 $this->_sections['dpm2']['index'] += $this->_sections['dpm2']['step'], $this->_sections['dpm2']['iteration']++):
$this->_sections['dpm2']['rownum'] = $this->_sections['dpm2']['iteration'];
$this->_sections['dpm2']['index_prev'] = $this->_sections['dpm2']['index'] - $this->_sections['dpm2']['step'];
$this->_sections['dpm2']['index_next'] = $this->_sections['dpm2']['index'] + $this->_sections['dpm2']['step'];
$this->_sections['dpm2']['first']      = ($this->_sections['dpm2']['iteration'] == 1);
$this->_sections['dpm2']['last']       = ($this->_sections['dpm2']['iteration'] == $this->_sections['dpm2']['total']);
?>

                    <?php $this->assign('dayId', ((is_array($_tmp=$this->_sections['dpm2']['index']+1)) ? $this->_run_mod_handler('string_format', true, $_tmp, '%02d') : smarty_modifier_string_format($_tmp, '%02d'))); ?>
                    <?php $this->assign('monthId', ((is_array($_tmp=($this->_foreach['feach']['iteration']-1))) ? $this->_run_mod_handler('string_format', true, $_tmp, '%02d') : smarty_modifier_string_format($_tmp, '%02d'))); ?>

                    <?php if (($this->_foreach['feach']['iteration']-1) != 12): ?>
                        <?php $this->assign('dateId', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['currYear'])) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['monthId']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['monthId'])))) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['dayId']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['dayId']))); ?>
                    <?php else: ?>
                        <?php $this->assign('dateId', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['nextYear'])) ? $this->_run_mod_handler('cat', true, $_tmp, '00') : smarty_modifier_cat($_tmp, '00')))) ? $this->_run_mod_handler('cat', true, $_tmp, $this->_tpl_vars['dayId']) : smarty_modifier_cat($_tmp, $this->_tpl_vars['dayId']))); ?>
                    <?php endif; ?>

                    <span id="<?php echo $this->_tpl_vars['dateId']; ?>
" class="day calendarElement <?php if ($this->_tpl_vars['currDate'] > $this->_tpl_vars['dateId'] || ((is_array($_tmp=$this->_tpl_vars['dateId'])) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['bookedDates']) : in_array($_tmp, $this->_tpl_vars['bookedDates']))): ?>disabledDay<?php endif; ?>"><?php echo $this->_sections['dpm2']['index']+1; ?>
</span>
                <?php endfor; endif; ?>
            </div>

        <?php endforeach; endif; unset($_from); ?>

    </div>

    <?php $_from = $this->_tpl_vars['pricesPerDay']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['price']):
?>

        <input type="hidden" value="<?php echo $this->_tpl_vars['price'][1]; ?>
" id="price<?php echo $this->_tpl_vars['price'][0]; ?>
" />

    <?php endforeach; endif; unset($_from); ?>

    <div id="priceInfo">
        <br />
        <span>
            <span class="priceInfo" id="priceInfoP1"></span><?php echo $this->_tpl_vars['currYear']; ?>
 
            <span class="priceInfo" id="priceInfoP2"></span><?php echo $this->_tpl_vars['currYear']; ?>

            <span class="priceInfo" id="priceInfoP3"></span><?php echo $this->_tpl_vars['currYear']; ?>

            <span class="priceInfo" id="priceInfoP4"></span><?php echo $this->_tpl_vars['nextYear']; ?>

            <span class="priceInfo" id="priceInfoP5"></span> <?php echo $this->_tpl_vars['addPrice']; ?>

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