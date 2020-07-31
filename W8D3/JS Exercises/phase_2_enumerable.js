Array.prototype.myEach = function (func) {
    for(i = 0; i < this.length; i ++) {
        func(this[i]);
    }

    return undefined
}


Array.prototype.myMap = function (func) {
    const arr = [];
    this.myEach((ele) => arr.push(func(ele)))
    return arr
}

Array.prototype.myReduce = function (func,initialValue) {
    
    if (initialValue !== undefined) {
        var acc = initialValue
        
        for (i = 0; i < this.length; i++) {
            acc = func(acc, this[i])
        }

    }

    else {
        var acc = this[0]
        for(i = 1; i < this.length; i++) {
            acc = func(acc, this[i])
        }
    }

    return acc
}


