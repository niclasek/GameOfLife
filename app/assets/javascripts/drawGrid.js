/**
 * Created by nek on 2014-07-29.
 */


var HashToPut = new Object();

var doOnLoad = function() {
    var m = $('.grid_information').data('m');
    var n = $('.grid_information').data('n');
    var GHCells = $('.grid_information').data('gh');
    var grid;

    grid = clickableGrid(m,n,function(el,row,col){
        if (el.className=='alive') {
            el.className='dead';
            HashToPut[row + " " + col] = 0;
        } else {
            el.className='alive';
            HashToPut[row + " " + col] = 1;
        }
    });

    document.body.appendChild(grid);

    function clickableGrid(rows, cols, callback){
        var grid = document.createElement('table');
        grid.className = 'grid';
        for (var r=0;r<rows;++r) {
            var tr = grid.appendChild(document.createElement('tr'));
            for (var c = 0;c<cols;++c) {
                var cell = tr.appendChild(document.createElement('td'));
                if (GHCells[r + " " + c] == 1) {
                    cell.className='alive';
                } else {
                    cell.className='dead';
                }
                cell.addEventListener('click',(function(el,r,c){
                    return function(){
                        callback(el,r,c);
                    }
                })(cell,r,c),false);
            }
        }
        return grid;
    }

};

$(document).ready(doOnLoad);
$(document).on('page:load', doOnLoad);