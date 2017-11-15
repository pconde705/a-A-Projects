import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
import { fetchTodos } from './actions/todo_actions';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  window.fetchTodos = fetchTodos;
  window.store = store;

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
