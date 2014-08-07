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

    $('#take-a-step-redirect-button').click(function(event){
        event.preventDefault();
        $.ajax({
            type: 'PUT',
            url: "/game/put_user_input",
            data: JSON.stringify(HashToPut),
            contentType: "application/json",
            success: function(result) {
                console.log("next-button-success")
                window.location.replace("/game/next");
            },
            error: function(xhr,status,error){
                console.log(xhr);
                document.write(error);
            }
        });

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

















