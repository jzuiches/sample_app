var ready;
var remove_fields;

ready = function () {

        $(".navbar-toggle").on("click", function () {
            $(this).toggleClass("active");
        });
        $(".navbar-nav li").hover(function() {

          $(this).toggleClass("active");
        });
        $(".remove_link").click(function(){
          $(this).prev("input").attr('value', true)
          $(this).parent().slideUp()
        })




      };





$(document).ready(ready);
$(document).on('page:load', ready);