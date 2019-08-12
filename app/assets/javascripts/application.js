// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-3.3.1
//= require rails-ujs
//= require activestorage
//= require cable
//= require turbolinks
//= require_self
//= require_tree .

$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

});

function startTime() {
  var today = new Date();
  var d = today.getDate();
  var mo = today.getMonth() + 1;
  var y = today.getFullYear();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('txt').innerHTML =
  d + "-" + mo + "-" + y + " " + h + ":" + m + ":" + s;
  var t = setTimeout(startTime, 500);
}

function checkTime(i) {
  if (i < 10) {i = "0" + i};
  return i;
}

function display(i) {
  var x = document.getElementById("add");
  if (x.style.display === "none") {
      x.style.display = "block";
  } else {
      x.style.display = "none";
  }
};

function scrollBoard() {
  var element = document.getElementById("board");
  if (typeof(element) != 'undefined' && element != null) {
    if((element.scrollHeight - element.clientHeight) <= element.scrollTop){
      element.scrollTop = 0;
    }
  }
};

/*setInterval(scrollBoard,10000);

$(document).on('turbolinks:load', function() {
  $('#selectAll').click(function() {
     if (this.checked) {
         $('.c1').each(function() {
             this.checked = true;
         });
     } else {
        $('.c1').each(function() {
             this.checked = false;
         });
     }
  });
  $('#selectAll1').click(function() {
     if (this.checked) {
         $('.c2').each(function() {
             this.checked = true;
         });
     } else {
        $('.c2').each(function() {
             this.checked = false;
         });
     }
  });
});*/
