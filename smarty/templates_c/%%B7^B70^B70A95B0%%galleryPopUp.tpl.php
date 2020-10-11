<?php /* Smarty version 2.6.26, created on 2013-05-06 10:54:04
         compiled from galleryPopUp.tpl */ ?>
<img src="images/gallery/controls/close.png" id="galPopUpClose" alt="close"/>

<input type="hidden" id="imgNum" value="<?php echo $this->_tpl_vars['img']; ?>
"/>

<div id="popUpContent">

    <div id="bigPopUpImg">

        <img src="images/gallery/bigImages/imgB<?php echo $this->_tpl_vars['img']; ?>
.jpg" id="gallPopUpImg0" class="gallPopUpImg" alt="gallImg1"/>
        <img src="images/gallery/bigImages/imgB<?php echo $this->_tpl_vars['img']; ?>
.jpg" id="gallPopUpImg1" class="gallPopUpImg" alt="gallImg2"/>

    </div>

    <div id="lowerPopUpInfo" class="popUpInfo">
    </div>

    <div id="upperPopUpInfo" class="popUpInfo">
    </div>
        
    <span id="upperPopUpInfoText"></span>
    
    <span id="lowerPopUpInfoText">
        <span id="imgSeqInfo"></span> / <span id="maxImgSeqInfo"></span>
    </span>

    <div id="leftPopUpVeil" class="popUpControls">
    </div>

    <div id="rightPopUpVeil" class="popUpControls">
    </div>

    <div id="gallPopUpLeftContImg" class="controlImgCont">
        <img src="images/gallery/controls/left.gif" id="gallPopUpLeftImg" alt="left"/>
    </div>

    <div id="gallPopUpRightContImg" class="controlImgCont">
        <img src="images/gallery/controls/right.gif" id="gallPopUpRightImg" alt="right"/>
    </div>

</div>