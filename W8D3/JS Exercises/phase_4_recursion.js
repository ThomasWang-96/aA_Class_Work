function range(start,end) {
    if (end === start) return [start];
    return range(start, end - 1).push(end)
}

function sumRec(arr) {
    if (arr.length === 1) return arr[0];
    sumRec(arr.slice(0, arr.laength-1)) + arr[arr.length-1]
    }

function exponent(base,exp) {
    if (exp === 0) return 1;
    return exponent(base, exp-1) * base
}

// console.log(exponent(2,5))

function fibonacci(n) {
    
}

function deepDup(arr) {
    let newArr = [];
    for(i = 0; i < arr.length; i ++) {
        if (Array.isArray(arr[i])) {
            return deepDup(arr[i])}
        return newArr.push(arr[i])
    }
    return newArr
}



console.log(deepDup([1,2,[3,[4,5],6],7]))