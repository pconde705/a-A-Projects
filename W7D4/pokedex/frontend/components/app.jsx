import React from 'react';
import { Route } from 'react-router-dom';

import PokemonDetailContainer from './pokemon/pokemon_detail_container';
import PokemonIndexContainer from './pokemon/pokemon_index_container';

export default () => {
  return (
    <div>
      <Route path="/" component={PokemonIndexContainer} />
      <Route path='/pokemon/:id' component={ PokemonDetailContainer }/>
    </div>
  );
};
