$(document).on('turbolinks:load', function() {
  const textArea = $('textarea');
  const charCounter = $('#char-counter');
  textArea.on('input', () => {
    let chars = 140 - textArea.val().length;
    charCounter.text(chars);
  })
});
