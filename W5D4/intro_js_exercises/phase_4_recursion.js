
// function range(start, end, array = []) {
//   array.push(start);
//   if (start === end) {
//     return array;
//   }
//   range(start + 1, end, array);
//   return array;
// }

function range(start, end) {
  if (start === end) {
    return [];
  }
  let array = range(start, end - 1);
  array.push(end - 1);
  return array;
}

console.log(range(5, 22));


function sumRec(arr) {
  if (arr.length < 2) {
    return arr[0];
  }
  let num = arr[0];
  num += sumRec(arr.slice(1));
  // You must invoke the function in this case. And also -1 doesn't work in Javascript,
  // the slice method automatically assumes you mean the last element (unless you pass something in).
  return num;
}

console.log(sumRec([1,2,3]));
