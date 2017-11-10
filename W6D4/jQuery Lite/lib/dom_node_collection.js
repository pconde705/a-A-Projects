class DOMNodeCollection {
  constructor(HTMLarray) {
    this.HTMLarray = HTMLarray;
  }
}

DOMNodeCollection.prototype.html = function (string = "") {
  if (string) {
    this.HTMLarray.forEach((el) => {
      el.innerHTML = string;
    });
  } else {
    return this.HTMLarray[0];
  }
};

DOMNodeCollection.prototype.empty = function () {
  this.HTMLarray.forEach( (el) => {
    el.innerHTML = "";
  });
};

DOMNodeCollection.prototype.append = function (argument) {
  // debugger
  if (typeof argument === "string") {
    this.HTMLarray.forEach( (el) => {
      el.innerHTML += argument;
    });
  } else if (argument instanceof DOMNodeCollection) {
    argument.HTMLarray.forEach( (el) => {
      this.HTMLarray.forEach((innerEl) => {
        innerEl.append(el.cloneNode(true));
      });
    });
  } else {
    this.HTMLarray.forEach( (el) => {
      el.append(argument.cloneNode(true));
    });
  }
};

DOMNodeCollection.prototype.children = function () {
  let arr = [];
  this.HTMLarray.forEach( (el) => {
    arr = arr.concat(Array.from(el.children));
  });
  return new DOMNodeCollection(arr);
};

DOMNodeCollection.prototype.parent = function () {
  let arr = [];
  this.HTMLarray.forEach( (el) => {
    arr.push(el.parentElement)
  });
  return new DOMNodeCollection(arr);
};

DOMNodeCollection.prototype.find = function (argument) {
  let found = [];
  this.HTMLarray.forEach((el) => {
    found = found.concat(Array.from(el.querySelectorAll(argument)));
  });
  return new DOMNodeCollection(found);
};

DOMNodeCollection.prototype.remove = function () {
  this.empty();
  this.HTMLarray = [];
};

DOMNodeCollection.prototype.on = function (type, callback) {
  this.HTMLarray.forEach( (el) => {
    el.addEventListener(type, callback);
    el[callback] = callback;
  });
};

DOMNodeCollection.prototype.off = function (type) {
  this.HTMLarray.forEach( (el) => {
    el.removeEventListener(type, el[callback]);
  });
};















module.exports = DOMNodeCollection;














//