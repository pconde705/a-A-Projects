
Array.prototype.myEach = function myEach (callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

function print(el) {
  console.log(el + 2);
}

const d = [5,4,3,2,1];
console.log(d.myEach(print));


Array.prototype.myMap = function myMap (callback) {
  const result = [];

  this.myEach(el => result.push(callback(el)));

// OR it can be solved this way:
// this.myEach(function(el) {
//   result.push(callback(el));
// });

// OR it can also be solved this way:
//   function add(el) {
//     result.push(callback(el));
//   }
//   this.myEach(el => add(el));

  return result;
};

// We can use this callback:
// function add(el) {
//   return el + 5;
// }
// OR we can also use this callback:
// (el => el + 5);

const e = [10,11,12,13,14];
console.log(e.myMap(el => el + 5));


Array.prototype.myReduce = function myReduce (callback, initialValue) {
  if (typeof initialValue != 'undefined') {
    var num = initialValue;
  } else {
    var num = 0;
  }

  this.myEach(function(el) {
    callback(num, el);
    num += el;
  });

  return num;
};


console.log([1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
})); // => 6

// with initialValue
console.log([1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
}, 25)); // => 31
