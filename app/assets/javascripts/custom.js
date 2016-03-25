var ready;
var remove_fields;

ready = function () {

        $(".navbar-toggle").on("click", function () {
            $(this).toggleClass("active");
        });
        $(".navbar-nav li").hover(function() {

          $(this).toggleClass("active");
        });
        $('body').on('click', '.remove_link',function(){
          debugger
          $(this).prev("input").attr('value', true)

          $(this).parent().slideUp()

          return false;
        })
      };


function addCodesField() {
      // create Date object
      var date = new Date();
      console.log("date" + date);
      //number of milliseconds since jan 1 1970
      var mSec = date.getTime();
      console.log("mSec" + mSec);
      //creates unique key for array by replacing 0
      idAttributeTrainingCodeId = "training_trainings_training_codes_attributes_0_training_code_id".replace("0", mSec);
      nameAttributeTrainingCode = "training[trainings_training_codes_attributes][0][training_code_id]".replace("0", mSec)
      labelAttributeTrainingCode = "training_trainings_training_code_attributes_0_training_codes".replace("0", mSec)
      destroyAttributeTrainingCode = "training[trainings_training_codes_attributes][0][_destroy]".replace("0", mSec)
      destroyAttributeTrainingCodeId = "training_trainings_training_codes_attributes_0__destroy".replace("0", mSec)
     //creates the field div and label element
      var field = document.createElement("div")
      field.classList.add("fields")
      var labelCodes = document.createElement("label");
      labelCodes.setAttribute("for", labelAttributeTrainingCode)
      var trainingCodesLabelText = document.createTextNode("Training codes");
      labelCodes.appendChild(trainingCodesLabelText);
      field.appendChild(labelCodes);

      //creates the select element inserts the appropriate name and id created above and puts the options in select element
       var selectCodes = document.createElement("select")
      var $optionCodes = $('select').first().children();
      $.each($optionCodes, function(i, val){
        var value = val.cloneNode(true)
        selectCodes.appendChild(value);
      });


      selectCodes.setAttribute("id", idAttributeTrainingCodeId);
      selectCodes.setAttribute("name", nameAttributeTrainingCode);
      field.appendChild(selectCodes)
      //creates hidden input field for remove link
      var hiddenInput = document.createElement("input");
      hiddenInput.setAttribute("type", "hidden");
      hiddenInput.setAttribute("value", false);
      hiddenInput.setAttribute("name", destroyAttributeTrainingCode);
      hiddenInput.setAttribute("id",destroyAttributeTrainingCodeId);
      field.appendChild(hiddenInput);

      var removeLink = document.createElement("a")
      removeLink.setAttribute("class", "remove_link")
      removeLink.setAttribute("href", "#");

      var trainingCodesAnchorText = document.createTextNode("remove");
      removeLink.appendChild(trainingCodesAnchorText)
      field.appendChild(removeLink);
      var addButton = document.getElementById("addAddress");
      var addButtonClone = addButton.cloneNode(true);
      field.appendChild(addButtonClone);

      console.log(field);
      document.getElementById('fields_container').appendChild(field)

}





$(document).ready(ready);
$(document).on('page:load', ready);