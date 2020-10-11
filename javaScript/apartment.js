window.lastTopImg;

/****************************************************************/

function topSlidShow()
{    
    $('#topApt span:first').animate({
        width: "-=100px"
    }, 2000, function() { 

        $(this).remove();
            
        if(window.lastTopImg < 3)
            window.lastTopImg++;
        else
            window.lastTopImg = 0;
                
        $("#topApt").append("<span class='topImg'><img src='images/apartment/top" + window.lastTopImg + ".png' id='img0" + window.lastTopImg + "'/></span>");
        
        if(window.lastTopImg >= 0)
            setTimeout("topSlidShow()", 1500);
    });
}

/****************************************************************/

/****************************************************************/

$('.topImg').live('mouseenter', function(){
    
    $(this).animate({
        marginTop: "+=10px"
    }, 600);
});

$('.topImg').live('mouseleave', function(){
    
    $(this).animate({
        marginTop: "-=10px"
    }, 600);
});

/****************************************************************/