import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component { // this signifies a presentational component
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemonItems = this.props.pokemon.map(
      poke => (<PokemonIndexItem key={poke.id} pokemon={poke} /> ) // You are only passing in a single pokemon at a time
      // Hence in the item file, you cannot map, you call it directly
    );
    return (
      <ul>
        {pokemonItems}

      </ul>
    );
  }
}

export default PokemonIndex;

// THIS IS A PRESENTATIONAL COMPONENT
