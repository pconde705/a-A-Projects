const Router = require('./router.js');


document.addEventListener("DOMContentLoaded", function() {
  const sidebar = document.querySelectorAll(".sidebar-nav li")
  sidebar.forEach( (el) => {
    el.addEventListener("click", function(event) {
      event.preventDefault();
      let inner = event.target.innerText;
      inner.toLowerCase();
      window.location.hash = inner;
      
    })
  })
  const content = document.querySelector(".content");
  const router = new Router(content);
  router.start();
  
  
});