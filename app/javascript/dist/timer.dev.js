"use strict";

document.addEventListener('turbolinks:load', function () {
  var question = document.querySelector('.form_question');
  var secId = question.dataset.sec;
  var question = document.querySelector('.form_question');
  var minId = question.dataset.min;
  var el = document.getElementById("timer"),
      mins = minId,
      secs = secId;

  function countDown() {
    if (secs || mins) {
      setTimeout(countDown, 1000); // Should be 1000, but I'm impatient
    }

    el.innerHTML = mins + ":" + (secs.toString().length < 2 ? "0" + secs : secs); // Pad number

    secs -= 1;

    if (secs < 0) {
      mins -= 1;
      secs = 59;
    }
  }

  countDown();
  console.log(secId);
});