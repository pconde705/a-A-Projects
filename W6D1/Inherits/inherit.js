Function.prototype.inherits = function inherit(SuperClass,Subclass){
  var Surrogate = function(){};
  Surrogate.prototype = SuperClass.prototype;
  Subclass.prototype = new Surrogate();
  Subclass.prototype.constructor = Subclass;
};

Function.prototype.inherits2 = function (SuperClass,Subclass) {
  Subclass.prototype = Object.create(SuperClass.prototype);
  Subclass.prototype.constructor = Subclass;
};
