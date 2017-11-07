// var args = Array.from(arguments);

function sumArguments () {
  let total = 0;
  for (var i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total;
}

function sumSpread (...args) {
  let total = 0;
  for (var i = 0; i < args.length; i++) {
    total += args[i];
  }
  return total;
}
