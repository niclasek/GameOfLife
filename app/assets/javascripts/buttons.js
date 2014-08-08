var loadButtons = function() {

    $('#take-a-step-button').click(function(event){
        event.preventDefault();
        saveAndStep();
    });

    $('#start-cycle-button').click(function(event){
        event.preventDefault();
        saveAndCycle();
    });

    $('#stop-cycle-button').click(function(event){
        event.preventDefault();
        clearTimeout(timer);
    });

    $('#load-partial-button').click(function(event){
        event.preventDefault();
    });

    $('#save-button').click(function(event){
        event.preventDefault();
        save();
    });

    $('#step-button').click(function(event){
        event.preventDefault();
        step();
    });
}

$(document).ready(loadButtons);
$(document).on('page:load', loadButtons);

















