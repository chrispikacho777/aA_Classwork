range = function(start, end) {
    if(start === end){
        return []
    };
    let temp = range(start,end-1);
    temp.push(end - 1);
    return temp;
};

// console.log(range(1,5));
sumRec = function(arr) {
    if (arr.length === 0){
        return 0;
    };
    let num = arr[0];
    return sumRec(arr.slice(1,arr.length)) + num;
};

// console.log(sumRec([1,2,3,4]));

exponent = function(base, exp) {
    if (exp === 0) {
        return 1
    };
    let num = exponent(base, exp-1);
    return base * num;
};

// console.log(exponent(2,4));

exponent2 = function(base, exp) {
    if (exp === 0) {
        return 1;
    };
    if (exp === 1) {
       return base;
    };
    if (exp % 2 ===0){
        let temp = exponent2(base, exp/2);
        return temp * temp;
    }
    else {
        let temp = exponent2(base, (exp-1)/2);
        return temp * temp * base;
    }
;}

console.log(exponent2(2,5));