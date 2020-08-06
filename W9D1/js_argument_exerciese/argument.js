function sum(...args){
    let total = 0;
    args.forEach((el) => {
        total += el;
    })

    return total;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);



