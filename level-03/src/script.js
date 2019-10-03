// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {
  var name100=document.querySelector("#name");
  var phone10=document.querySelector("#phone");
  var email=document.querySelector("#email");
  var department1=document.querySelector("#department1");
  var department2=document.querySelector("#department2");

  var initialize = function() {
    var button=document.querySelector(".button");
    button.addEventListener("click",onSubmit);
    document.querySelector("#department1").addEventListener("change",disableDuplicateSecondaryDepartment);

    /*
      1. Add all your event bindings here. Please avoid binding events inline and add your event listeners here.

      onSubmit callback
      disableDuplicateSecondaryDepartment callback,...
    */
  };
  
  var disableDuplicateSecondaryDepartment = function() {

    // 2. in department2, Should disable the option selected in department1
    var i=0;
    for(i=0;i<4;i++){
      if(department2.options[i].value===department1.value){
        department2.options[i].disabled=true;
        department2.value=department2.options[(i+1)%4].value;
      }
      else
      {
        department2.options[i].disabled=false;
      }
    }
    
  }

  var constructData = function() {
    var data = {
      "name":name100.value,
      "phno":phone10.value,
      "emailaddress":email.value,
      "department1":department1.value,
      "department2":department2.value
    };
    
    // 3. Construct data from the form here. Please ensure that the keys are the names of input elements
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
    var filter=/^([a-zA-Z0-9\.]+)(@college.edu)$/;
    if(data.name.length>100)
      isValid=false;
    else if(data.phno.length>10)
      isValid=false;
    else if(!filter.test(data.emailaddress))
      isValid=false;
    else if(data.department2===data.department1){
       isValid=false;
      }
    else
      isValid=true;
    // 4. Check if the data passes all the validations here

    return isValid;
  };

  var onSubmit = function() {
    event.preventDefault();
    var data = constructData();
    if (validateResults(data)) {
      printResults(data);
      console.log(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
