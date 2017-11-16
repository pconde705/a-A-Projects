import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);

  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    console.log(this.props);
    return (
      <ul>
        {this.props.pokemon.map(el =>
          <li><h1>{el.name}</h1>
          <img src={el.image_url}></img></li>
        )}
      </ul>
    );
  }
}

export default PokemonIndex;
