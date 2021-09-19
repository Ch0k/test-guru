"use strict";

document.addEventListener('turbolinks:load', function () {
  var progressBar = document.querySelector('.progress-bar');
  var question = document.querySelector('.form_question');
  var questionId = question.dataset.questionId;
  var questionCount = question.dataset.testCount;
  CalcProcent(questionId, questionCount);

  function CalcProcent(questionId, questionCount) {
    var procent = questionId / questionCount * 100;
    progressBar.style.width = procent + "%";
  }
});