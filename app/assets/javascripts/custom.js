var ready;
ready = function () {
        $(".navbar-toggle").on("click", function () {
            $(this).toggleClass("active");
        });
      };
$(document).ready(ready);
$(document).on('page:load', ready);