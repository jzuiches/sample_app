var ready;
var remove_fields;

ready = function () {

        $(".navbar-toggle").on("click", function () {
            $(this).toggleClass("active");
        });
        $(".navbar-nav li").hover(function() {

          $(this).toggleClass("active");
        });
        $('.hidden_fields').hide();
        $('#add').click(function(){

          $(".hidden_fields").show();
        });
        $('#add-btn').click(function() {
          $(".hidden_fields").after($(".hidden_fields").html());

      });
        $("#remove-btn").click(function() {
          $(this).closest('.hidden_fields').hide();
        })



      };




$(document).ready(ready);
$(document).on('page:load', ready);