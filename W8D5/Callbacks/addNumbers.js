const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback) {
    if(numsLeft > 0) {
        reader.question('Type in a number:', function (answer) {
            const num = parseInt(answer);
            sum += num;
            console.log(sum);
            addNumbers(sum, numsLeft - 1, completionCallback)
        })
        // addNumbers(sum, numsLeft - 1, completionCallback)
    } 
    else {
        completionCallback(sum);
        reader.close()
    }
    console.log('last line of code')

}

addNumbers(0, 3, sum => {console.log(`Total Sum: ${sum}`)});









