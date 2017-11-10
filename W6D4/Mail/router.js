class Router {
  constructor(node) {
    this.node = node;
  }
}

Router.prototype.start = function () {
  this.render();
  window.addEventListener("hashchange", this.render.bind(this));
};

Router.prototype.activeRoute = function () {
  const hash = window.location.hash;
  return hash.slice(1);
};

Router.prototype.render = function () {
  this.node.innerHTML = "";
  const currentRoute = this.activeRoute();
  const p = document.createElement('p');
  p.innerHTML = currentRoute;
  this.node.appendChild(p);
};

module.exports = Router;