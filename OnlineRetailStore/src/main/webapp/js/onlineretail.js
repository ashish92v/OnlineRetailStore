function isNotEmpty(inputId, errorMsg) {
   var inputElement = document.getElementById(inputId);
   var errorElement = document.getElementById(inputId + "Error");
   var inputValue = inputElement.value.trim();
   var isValid = (inputValue.length != 0);  // boolean
   showMessage(isValid, inputElement, errorMsg, errorElement);
   return isValid;
}
function showMessage(isValid, inputElement, errorMsg, errorElement) {
	   if (!isValid) {
	      // Put up error message on errorElement or via alert()
	      if (errorElement != null) {
	         errorElement.innerHTML = errorMsg;
	      } else {
	         alert(errorMsg);
	      }
	      // Change "class" of inputElement, so that CSS displays differently
	      if (inputElement != null) {
	         //inputElement.className = "error1";
	         inputElement.focus();
	      }
	   } else {  
	      // Reset to normal display
	      if (errorElement != null) {
	         errorElement.innerHTML = "";
	      }
	      if (inputElement != null) {
	         //inputElement.className = "";
	      }
	   }
	}

