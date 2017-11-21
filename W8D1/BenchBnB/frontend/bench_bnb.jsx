import React from 'react';
import ReactDOM from 'react-dom';
import {postNewUser, postNewSession, deleteSession} from './util/session_api_util';
import configureStore from './store/store'
import Root from './components/root';


document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;


  // window.postNewUser = postNewUser;
  window.postNewSession = postNewSession;
  // window.deleteSession = deleteSession;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
