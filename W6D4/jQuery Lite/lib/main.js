const DOMNodeCollection = require('./dom_node_collection.js');

const $l = function(argument) {
  let arrayFunctions = [];
  if (argument instanceof HTMLElement) {
    return new DOMNodeCollection([argument]);
  } else if (argument instanceof Function) {
    if (document.readyState !== "complete") {
      arrayFunctions.push(argument);
    } else {
      arrayFunctions.forEach((el) => {
        el();
      });
    }
  } else {
    let selected = document.querySelectorAll(argument);
    return new DOMNodeCollection(Array.from(selected));
  }

}

$l.extend = function (...args) {
  return Object.assign(...args)
};

$l.ajax = function (optionsObject) {
  let defaults = {
    type: 'GET',
    dataType: 'JSON',
    url: "",
    data: {},
    success: response => {
      console.log(response);
    },
    error: err => {
      console.log(err);
    }
  };
  
    this.extend(defaults, optionsObject);
    
    const xhr = new XMLHttpRequest();
    
    xhr.open(defaults.type, defaults.url);
    
    xhr.onload = function () {
      // if (xhr.status === 200) {
      //   defaults.success(xhr.response);
      // } else {
      //   defaults.error(xhr.response);
      // }
      console.log(xhr.status);
      console.log(xhr.responseType);
      defaults.success(xhr.response);
    }
    
    const optionalData = defaults.data;
    xhr.send(JSON.stringify(optionalData));
  
};



window.$l = $l;
