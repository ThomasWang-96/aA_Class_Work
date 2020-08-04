const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2}? Enter \'yes\' or \'no\'`, function (answer) {
        if (answer === 'yes') {
            callback(true)
        } 
        else {
            callback(false)
        };
    });
    
}


function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.

    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
            if (isGreaterThan) {
                const tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;

                madeAnySwaps = true;
            }

            innerBubbleSortLoop(
                arr, i + 1, madeAnySwaps, outerBubbleSortLoop
            );
        });
    }

    if (i === (arr.length -  1)) {
        outerBubbleSortLoop(madeAnySwaps);
        return 
    }

}

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps == true){
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
        }
        if (madeAnySwaps == false){
            sortCompletionCallback(arr)
        }
    }
    outerBubbleSortLoop(true)
}



absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});
