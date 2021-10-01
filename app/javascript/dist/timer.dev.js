"use strict";

document.addEventListener('turbolinks:load', function () {
  var question = document.querySelector('.form_question');
  var secId = question.dataset.sec;
  var minId = question.dataset.min;
  var el = document.getElementById("timer");
  var form = document.forms[0];
  mins = minId;
  secs = secId;

  if (mins != null && secs != null) {
    var countDown = function countDown() {
      if (mins >= 0 || mins == null) {
        setTimeout(countDown, 1000); // Should be 1000, but I'm impatient
      } else {
        form.submit();
      }

      el.innerHTML = mins + ":" + (secs.toString().length < 2 ? "0" + secs : secs); // Pad number

      secs -= 1;

      if (secs < 0 && mins >= 0) {
        mins -= 1;
        secs = 59;
      }
    };

    countDown();
  }
});