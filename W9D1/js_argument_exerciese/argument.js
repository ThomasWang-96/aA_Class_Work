function sum(...args){
    let total = 0;
    args.forEach((el) => {
        total += el;
    })

    return total;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);


class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

//function instance => myBind

Function.prototype.myBind = function (dog) {
    return () => {
        this.call(dog)
    }
}


// Function.prototype.myBind = function (ctx, ...args) {
//     return () => {
//         this.apply(ctx,args)
//     }
// };


Function.prototype.myBind = function (ctx, ...args) {
    return (...args) => {
        this.apply(ctx, args);
    };
};

// Function.prototype.myBind = function (ctx) {
//     return () => {
//         this.apply(ctx);
//     };
// };


// Function.prototype.myBind = function (ctx, arg1, ...args) {
//   return (args) => {
//     this.call(ctx, arg1, args);
//   };
// };

// Function.prototype.myBind1 = function (ctx) {
//     const fn = this;
//     const bindArgs = Array.from(arguments).slice(1);
//     return function _boundFn() {
//         const callArgs = Array.from(arguments);
//         return fn.apply(ctx, bindArgs.concat(callArgs));
//     };
// };

Function.prototype.myBind = function (ctx, ...bindArgs) {
    return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
};



// markov.says("meow", "Ned");
// markov.says.myBind(pavlov, "meow", "Kush")();
// markov.says.myBind(pavlov)("meow", "a tree");
// markov.says.myBind(pavlov, "meow")("Markov");

// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");


curriedSum = (numArgs) => {
     const nums = [];
     const _curriedSum = (num) => {
        nums.push(num)
        if (nums.length === numArgs) {
            let sumNums = nums.reduce(function(a, b) {
                return a + b;
            })
            return sumNums;
        } 
        else {
            return _curriedSum;
        }
     }
    return _curriedSum;
 }


// const currySum = curriedSum(4);
// console.log(currySum(5)(30)(20)(1)); // => 56



// Function.prototype.curry = function(numArgs) {
//     const numbers = [];
//     const _curry = (newNum) => {
//         numbers.push(newNum)
//         if (numbers.length === numArgs) {
//             return this.apply(null,numbers)
//         }
//         else {
//             return _curry
//         }
//     }
//     return _curry
// }


Function.prototype.curry = function (numArgs) {
    const numbers = [];
    const _curry = (newNum) => {
        numbers.push(newNum)
        if (numbers.length === numArgs) {
            return this(...numbers)
        }
        else {
            return _curry
        }
    }
    return _curry
}



function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30



