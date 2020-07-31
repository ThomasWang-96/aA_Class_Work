Array.prototype.bubbleSort = function() {
    var sorted = false;

    while (!sorted) {
        sorted = true;

        for(i = 0; i < this.length - 1; i ++) {
            
            if (this[i] > this[i + 1]) {
               [this[i],this[i+1]] = [this[i+1], this[i]];
               sorted = false
            }

        }
    }
    return this
    
}
// console.log([5, 3, 4, 2, 1].bubbleSort());

String.prototype.substrings = function() {
    var arr = [];
    for(i = 0; i < this.length; i ++ ) {
        for (j = 0; j < this.length; j ++) {
            if (j >= i) {
                arr.push(this.slice(i, j+1));
            }
        }
    }

    return arr
}

// console.log("abc".substrings());

