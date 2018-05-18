$(document).on('click', '#student_doing_internship', function(event ){
  $('.compny-name').toggleClass('hide');
})

$(document).on('click', '#all-students', function(event ){
  var onDone = function (result) {
    var table = $(".table-dark")      
    var table_body = table.find('tbody')
    table.removeClass('hide');
    table_body.html("");
    if(result.length > 0){
      var html       = "<tr>"
      for (i = 0; i < result.length;i ++){
        student = Object.values(result[i]);
        for(j = 1; j < student.length - 2; j++){
          html += "<td>" + student[j] + "</td>";
        }
        html += "</tr>"
      }
      table_body.append(html);
    }else{
      table.after('<p class = "text-center" style = "color: white">No Results Found</p>')
    }
  }

  var onFail = function( err ) {
    console.log( "Error --> ", err );
  }

  ajaxCall('get', 'all_students', onDone, onFail, 'json');
})

function ajaxCall ( mType, url, doneCB, failCB, dataType) {
  var ajaxObj = {
    method: mType,
    url: url,
    dataType: 'json'
  }

  $.ajax(ajaxObj)
  .done(doneCB)
  .fail(failCB);
}

$(function() {
  setTimeout(function(){
    $('.alert').slideUp(800);
  }, 1500);
});

$(document).on('turbolinks:load', function() {
  $("#new_student").validate({
    rules: {
      "student[name]": {
        required: true,
        maxlength: 30,
        validateName: true
      },
      "student[email]": {
        required: true,
        maxlength: 50,
        email: true
      },
      "student[age]":{
        required: true,
        range: [18, 30]           
      },
      "student[college]":{
        required: true,
        validateCollege: true
      },
      "student[internship_company]":{
        required: true
      }
    },
    messages: {
      "student[name]": {
          required:  I18n.t("model.student.enter_val", {val: I18n.t("model.student.name")}),
          maxlength: I18n.t("model.student.character_validation", {val: I18n.t("model.student.name"), num: 30})
      },
      "student[email]": {
          required:  I18n.t("model.student.enter_val", {val: I18n.t("model.student.email")}),
          maxlength: I18n.t("model.student.character_validation", {val: I18n.t("model.student.email"), num: 50}),
          email:     I18n.t("model.student.valid_email")
      },
      "student[age]": {
          required:  I18n.t("model.student.enter_val", {val: I18n.t("model.student.age")}),
          range:      I18n.t("model.student.valid_age")
      },
      "student[college]": {
          required:  I18n.t("model.student.enter_val", {val: I18n.t("model.student.college")})
      },
      "student[internship_company]": {
          required:  I18n.t("model.student.enter_val", {val: I18n.t("model.student.internship_company")})
      }
    }
  });
});

// check name for a specific pattern
jQuery.validator.addMethod("validateName", function(value, element) {
  console.log("Name returns " + value + /kyle/i.test(value))
  return /kyle/i.test(value);
}, I18n.t("model.student.valid_name") );

// validate college
jQuery.validator.addMethod("validateCollege", function(value, element) {
  console.log("College value is" + value +  ["UCD", "UCC", "NUI Galway"].includes(value))
  return ["UCD", "UCC", "NUI Galway"].includes(value);
}, I18n.t("model.student.valid_college") );
