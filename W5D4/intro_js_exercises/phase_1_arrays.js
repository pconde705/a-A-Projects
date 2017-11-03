// Ruby equivalent:  [1, 2, 3].each { |el| puts el }

// Javascript equivalent (of each method):
// const arr = [];
// [1, 2, 3].forEach((el) => arr.push(el));
// [1, 2, 3].forEach(function(el) {
//   console.log(el);
// });


Array.prototype.uniq = function uniq () {
  const result = [];
  for (var i = 0; i < this.length; i++) {
    if (result.includes(this[i])) {
      continue;
    } else {
      result.push(this[i]);
    }
  }
  return result;
};

const a = [1,2,3,3,4];
console.log(a.uniq());

Array.prototype.twoSum = function twoSum () {
  const result = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i,j]);
      }
    }
  }
  return result;
};

const b = [1,2,3,-3,-1,5,-2];
console.log(b.twoSum());



Array.prototype.transpose = function transpose () {
  const result = [];
  var temp = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = 0; j < this.length; j++) {
      temp.push(this[j][i]);
      if (j === 2) {
        result.push(temp);
        var temp = [];
      }
    }
  }
  return result;
};

const c = [[1,2,3], [4,5,6], [7,8,9]];
console.log(c.transpose ());
// [[1,4,7], [2,5,8], [3,6,9]]
