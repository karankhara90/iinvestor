function textboxStyle() {
   var inputs = document.getElementsByTagName('input');
      for (var i=0;i<inputs.length;i++) {
          if (inputs[i].type.toLowerCase() == 'text' || inputs[i].type.toLowerCase() == 'password'){
               inputs[i].className += ' inputText';
          }
          else if(inputs[i].type.toLowerCase() == 'submit'){
               inputs[i].className += ' inputSubmit';
          }
          else if(inputs[i].type.toLowerCase() == 'button'){
               inputs[i].className += ' inputButton';
          }
          else if(inputs[i].type.toLowerCase() == 'reset'){
               inputs[i].className += ' inputReset';
          }


     }
     var selects = document.getElementsByTagName('select');
      for (var i=0;i<selects.length;i++) {
               selects[i].className += ' selectBox';
      }
}