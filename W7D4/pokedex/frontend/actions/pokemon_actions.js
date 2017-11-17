export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
// here, the solution will import * as APIUtil..., but that's
// not needed if we avoid name collisions in the first place.
import { getAllPokemon } from '../util/api_util';
import { getOnePokemon } from '../util/api_util';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => (
  getAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const receiveOnePokemon = ({pokemon, items}) => ({
  type: RECEIVE_ONE_POKEMON,
  pokemon,
  items
});
// export const receiveOnePokemon = (response) => ({
//   type: RECEIVE_ONE_POKEMON,
//   pokemon: response.pokemon,
//   items: response.items
// });
// action.type showed that pokemon was nested inside a response (called pokemon) so we had to extract it
// hance the pokemon: response.pokemon

export const requestOnePokemon = (id) => (dispatch) => (
  getOnePokemon(id)
    .then(pokemon => dispatch(receiveOnePokemon(pokemon)))
);
