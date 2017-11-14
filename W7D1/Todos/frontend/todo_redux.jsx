import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import App from './components/app';
import Root from './components/root';
import { allTodos } from './reducers/selectors';


const store = configureStore();
document.addEventListener("DOMContentLoaded", () => {

  window.store = store;
  window.allTodos = allTodos;


  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
