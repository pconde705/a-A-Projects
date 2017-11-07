class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;

  }

}

//call-time
Function.prototype.myBind = function (context){
  let newArr = Array.from(arguments);
  newArr.shift();
  let func = this;


//bind-time
  return function() {
    let innerArr = Array.from(arguments);
    func.apply(context, newArr.concat(innerArr));
  };

  // Function.prototype.myBind = function (context, ...args) {
  //
  //   let temp = this;
  //
  //   return function(...extra) {
  //     temp.apply(context, args.concat(extra));
  //   };
  // };
// Arrow Function doesn't keep scope, we need to define a new function. this refers to says()

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true
