// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui-1.10.4.custom
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.tabs
//= require bootstrap


$(document).ready(function(){
    $('.bxslider').bxSlider( {
        slideWidth:750,
        auto: true,
        autoControls: true
    });

    $('#slider-next').click(function(){
        slider.goToNextSlide();
        return false;
    });

    $('#title').css('visibility', 'visible').animate({opacity: 1.0}, 2000);
    $('#title').animate({fontSize:"+=5"});


    $('#brief').css('visibility', 'visible').animate({opacity: 2.0}, 2000);
    $('#subtitle1').animate({fontSize:"+=12"});



    $('#post_user_name').autocomplete({
        // This shows the min length of characters that must be typed before the autocomplete looks for a match.
        minLength: 2,
        // This is the source of the autocomplete suggestions.
        source: "/ajax/users" ,
        // This updates the textfield when you move the updown the suggestions list, with your keyboard. In our case it will reflect the same value that you see in the suggestions which is the item.label.
        focus: function(event, ui) {
            $('#post_user_name').val(ui.item.label);
            $('input#search_user_link').val(ui.item.link);
            return false;
        },
        // Once a value in the drop down list is selected, do the following:
        select: function(event, ui) {
            $('#post_user_name').val(ui.item.label);
            return false;
        }
    })
        .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
        var inner_html = '<a href = ' + item.link +'><div class="list_item_container"><div class="label">' + item.label + '</div></div></a>';
        return $( "<li></li>" )
            .data( "item.autocomplete", item )
            .append(inner_html)
            .appendTo( ul );
    };

    $('#post_user_name').pressEnter(function(){
        if ($('#post_user_name').val() != null  ) {
            window.location.href = $('input#search_user_link').val();
        }
    });


});

jQuery.fn.pressEnter = function(fn) {
    return this.each(function() {
        $(this).bind('enterPress', fn);
        $(this).keyup(function(e){
            if(e.keyCode == 13)
            {
                $(this).trigger("enterPress");
            }
        })
    });
};
