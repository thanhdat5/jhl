(function(b){function a(d,c){return d.toFixed(c.decimals)}b.fn.countTo=function(c){c=c||{};return b(this).each(function(){function h(){p+=j;q++;m(p);if(typeof g.onUpdate=="function"){g.onUpdate.call(t,p)}if(q>=d){e.removeData("countTo");clearInterval(k.interval);p=g.to;if(typeof g.onComplete=="function"){g.onComplete.call(t,p)}}}function m(i){var f=g.formatter.call(t,i,g);e.text(f)}var g=b.extend({},b.fn.countTo.defaults,{from:b(this).data("from"),to:b(this).data("to"),speed:b(this).data("speed"),refreshInterval:b(this).data("refresh-interval"),decimals:b(this).data("decimals")},c);var d=Math.ceil(g.speed/g.refreshInterval),j=(g.to-g.from)/d;var t=this,e=b(this),q=0,p=g.from,k=e.data("countTo")||{};e.data("countTo",k);if(k.interval){clearInterval(k.interval)}k.interval=setInterval(h,g.refreshInterval);m(p)})};b.fn.countTo.defaults={from:0,to:0,speed:1000,refreshInterval:100,decimals:0,formatter:a,onUpdate:null,onComplete:null}})(jQuery);jQuery(document).ready(function(){if("undefined"!==typeof(jQuery.fn.waypoint)){jQuery(".counter").waypoint(function(){jQuery(this).find(".display-percentage").each(function(){var a=jQuery(this).data("percentage");jQuery(this).countTo({from:0,to:a,refreshInterval:10,speed:1000})})},{triggerOnce:true,offset:"bottom-in-view"})}});