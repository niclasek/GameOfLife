/**
 * Created by nek on 2014-08-05.
 */

var loadButtons = function() {

    $('#take-a-step-button').click(function(event){
        event.preventDefault();
        saveUserInput();
        oneStepFunction();
    });

    $('#start-cycle-button').click(function(event){
        event.preventDefault();
        saveUserInput();
        cycleFunction();
    });

    $('#stop-cycle-button').click(function(event){
        event.preventDefault();
        clearTimeout(timer1);
        clearTimeout(timer);
    });

    $('#load-partial-button').click(function(event){
        event.preventDefault();
        //cycleFunction();
    });


}

$(document).ready(loadButtons);
$(document).on('page:load', loadButtons);
//$(document).on('page:change', loadButtons);
















