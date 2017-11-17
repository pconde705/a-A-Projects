import React from 'react'; // Every time you have a JSX file you must import React
import { Link, Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';


const PokemonIndexItem = (props) => {
  return <div>
    <Link to={`/pokemon/${props.pokemon.id}`}>
      <li>
        <h1>{props.pokemon.name}</h1>
        <img src={props.pokemon.image_url}></img>
      </li>
    </Link>
  </div>;
};
export default PokemonIndexItem;


// THIS IS A FUNCTIONAL COMPONENT
