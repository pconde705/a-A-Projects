import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container'; //we can name it anything, convention to call it container

const Root = ({ store }) => (
  <Provider store={store}>
    <div><PokemonIndexContainer /></div>
  </Provider>
);

export default Root;
