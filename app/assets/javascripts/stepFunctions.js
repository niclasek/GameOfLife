
var timer;

var step = function() {

    $.ajax({
        type: 'GET',
        url: "/game/get_partial",
        success: function(result) {
            console.log("get-partial-step-success");
            $("#grid-container").html(result);
            loadGrid();
        },
        error: function(xhr,status,error){
            console.log(xhr);
            document.write(error);
        }
    });
}

var cycle = function() {

    $.ajax({
        type: 'GET',
        url: "/game/get_partial",
        success: function(result) {
            console.log("get-partial-cycle-success");
            $("#grid-container").html(result);
            loadGrid();
            timer = setTimeout(saveAndCycle, 100);
        },
        error: function(xhr,status,error){
            console.log(xhr);
            document.write(error);
        }
    });
}

var saveAndCycle = function() {
        $.ajax({
            type: 'PUT',
            url: "/game/put_user_input",
            data: JSON.stringify(HashToPut),
            contentType: "application/json",
            success: function(result) {
                console.log("put-user-input-saveAndCycle-success");
                cycle();
            },
            error: function(xhr,status,error){
                console.log(xhr);
                document.write(error);
            }
        });
}

var saveAndStep = function() {
    $.ajax({
        type: 'PUT',
        url: "/game/put_user_input",
        data: JSON.stringify(HashToPut),
        contentType: "application/json",
        success: function(result) {
            console.log("put-user-input-saveAndStep-success");
            step();
        },
        error: function(xhr,status,error){
            console.log(xhr);
            document.write(error);
        }
    });
}

var save = function() {
    $.ajax({
        type: 'PUT',
        url: "/game/put_user_input",
        data: JSON.stringify(HashToPut),
        contentType: "application/json",
        success: function(result) {
            console.log("put-user-input-save-success");
        },
        error: function(xhr,status,error){
            console.log(xhr);
            document.write(error);
        }
    });
}
