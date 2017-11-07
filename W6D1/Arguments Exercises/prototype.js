Function.prototype.curry = function (numArgs){
  let numbers = [];
  let temp = this;
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return temp.apply(temp.this, numbers); // This is the important
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;

};


function wildThree(num1, num2, num3) {
  return num1 / num2 * num3;
}

console.log(wildThree(20, 4, 6));

console.log(wildThree.curry(3)(20)(4)(6));
