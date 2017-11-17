import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.match.params.id !== this.props.match.params.id) {
      this.props.requestOnePokemon(nextProps.match.params.id);
    }

  }

  render() {
    const poke = this.props.pokemon[this.props.match.params.id];
    if (!poke) {
      return ("");
    } else {
    return (
      <div className="pokemon-single-div">
        <ul>
          <li>{poke.name}</li>
          <li>{poke.attack}</li>
          <li>{poke.defense}</li>
          <li>{poke.poke_type}</li>
          <li>{poke.moves}</li>
          <img src={poke.image_url}></img>
        </ul>
      </div>
    );
  }
  }
}

export default PokemonDetail;
