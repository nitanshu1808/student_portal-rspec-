$(document).on('click', '#student_doing_internship', function(event ){
  $('.compny-name').toggleClass('hide');
})

$(document).on('click', '#all-students', function(event ){
  var onDone = function (result) {
    var table = $(".table-dark")      
    var table_body = table.find('tbody')
    var html       = "<tr>"
    for (i = 0; i < result.length;i ++){
      student = Object.values(result[i]);
      for(j = 1; j < student.length - 2; j++){
        html += "<td>" + student[j] + "</td>";
      }
      html += "</tr>"
    }
    table.removeClass('hide');
    table_body.html("");
    table_body.append(html);
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