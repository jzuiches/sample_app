var ready;
var remove_fields;
ready = function () {

        $(".navbar-toggle").on("click", function () {
            $(this).toggleClass("active");
        });
        $(".navbar-nav li").hover(function() {

          $(this).toggleClass("active");
        });
        $('.hidden-codes').hide();
        $('#training_trainings_training_codes').click(function(){
          $('.hidden-codes').show();
        });
        $('#remove_link').click(function() {
          console.log("hello")
        $(".fields input").attr('value', 1);
        $(".fields").hide()
      });



      };




$(document).ready(ready);
$(document).on('page:load', ready);