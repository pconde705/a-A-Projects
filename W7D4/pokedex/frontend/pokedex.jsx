import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon, receiveOnePokemon, requestOnePokemon } from './actions/pokemon_actions';
import fetchAllPokemon from './util/api_util';
import { pokemonReducer } from './reducers/pokemon_reducer';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.pokemonReducer = pokemonReducer;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.receiveOnePokemon = receiveOnePokemon;
  window.requestOnePokemon = requestOnePokemon;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
