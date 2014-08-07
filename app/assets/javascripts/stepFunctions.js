/**
 * Created by nek on 2014-08-06.
 */

var timer;

var cycleFunction = function() {

    $.ajax({
        type: 'GET',
        url: "/game/get_partial",
        success: function(result) {
            console.log("get-partial-button-success");
            $("#grid-container").html(result);
            loadGrid();
            timer = setTimeout(cycleFunction, 3000);
        },
        error: function(xhr,status,error){
            console.log(xhr);
            document.write(error);
        }
    });
}

var oneStepFunction = function() {

    $.ajax({
        type: 'GET',
        url: "/game/get_partial",
        success: function(result) {
            console.log("get-partial-button-success");
            $("#grid-container").html(result);
            loadGrid();
        },
        error: function(xhr,status,error){
            console.log(xhr);
            document.write(error);
        }
    });
}

var saveUserInput = function() {
        $.ajax({
            type: 'PUT',
            url: "/game/put_user_input",
            data: JSON.stringify(HashToPut),
            contentType: "application/json",
            success: function(result) {
                console.log("next-button-success")
            },
            error: function(xhr,status,error){
                console.log(xhr);
                document.write(error);
            }
        });
}