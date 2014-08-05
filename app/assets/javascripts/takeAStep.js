/**
 * Created by nek on 2014-08-05.
 */

var doOnLoad = function() {


    $('#take-a-step-button').click(function(event){
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
}

$(document).ready(doOnLoad);
$(document).on('page:load', doOnLoad);