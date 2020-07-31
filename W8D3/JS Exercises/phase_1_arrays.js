Array.prototype.uniq = function () {
    var dic = {};
    this.forEach( (ele) => {
        dic[ele] = true
    }
    );
    return Object.keys(dic);
};


// console.log([1, 2, 2, 3, 3, 3].uniq())

Array.prototype.twoSum = function () {
    const hash = {};
    let pairs = [];
    this.forEach((el,idx) => {
        hash[el] ? hash[el].push(idx) : hash[el] = [idx]
        
        if (hash[el * -1]) {
            var newPairs = hash[el * -1].map((prevIdx)=> [prevIdx, idx]);
            pairs = pairs.concat(newPairs)
        }
        
    }
    )
   return pairs;
}


// console.log([-1, 0, -1, 2, -2, 1].twoSum());


Array.prototype.transpose = function () {
    const newArr = Array.from(
        new Array(this[0].length), 
        () => new Array(this.length)
    )

    for (i = 0; i < this.length; i ++ ) {
        for (j = 0; j < this[i].length; j ++ ) {
            newArr[j][i] = this[i][j]
        }
    };

    return newArr;
}
// console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());



