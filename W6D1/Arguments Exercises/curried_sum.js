function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let total = 0;
      numbers.forEach(function(el) {
        total += el;
      });
      console.log(total);
      return total;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

const sum = curriedSum(4);
sum(5)(30)(20)(1); // => 56
