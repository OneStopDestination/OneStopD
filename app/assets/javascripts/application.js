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
        auto: true,
        autoControls: true,
        slideWidth:350
    });

    $('#slider-next').click(function(){
        slider.goToNextSlide();
        return false;
    });

    $('#post_user_name').autocomplete({source: "/ajax/users"}).data("ui-autocomplete")._renderItem = function( ul, item ) {
        var inner_html = '<a href = ' + item.link +'><div class="list_item_container"><div class="label">' + item.label + '</div></div></a>';
        return $( "<li></li>" )
            .data( "item.autocomplete", item )
            .append(inner_html)
            .appendTo( ul );
    };
});