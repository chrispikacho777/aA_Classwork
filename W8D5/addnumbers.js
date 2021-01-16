const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function AddNumbers(sum, NumsLeft, cb) {
    if (NumsLeft > 0) {
        reader.question("Enter a number: ", function (numString) {
            const num = parseInt(numString);
            sum += num;
              console.log(sum);
              AddNumbers(sum, NumsLeft - 1, cb);
          });
        }
        else {
            cb(sum);
            reader.close();
        }  

}


AddNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));