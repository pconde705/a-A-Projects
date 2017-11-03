Array.prototype.bubbleSort = function bubbleSort () {
  while (this !== this.sort()) {
    for (var i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i+1]) {
        var a = this[i];
        this[i] = this[i+1];
        this[i+1] = a;
      }
    }
  }
  return this;
};


console.log([1,3,5,2,6,4].bubbleSort());


String.prototype.substrings = function substrings() {
  const result = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = 0; j < this.length; j++) {
      if (this.slice(i, j+1) === "") {
        continue;
      } else {
      result.push(this.slice(i,j+1));
     }
    }
  }
  return result;
};


console.log("abc".substrings());
