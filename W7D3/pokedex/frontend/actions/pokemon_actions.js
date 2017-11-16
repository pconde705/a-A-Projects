export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
// here, the solution will import * as APIUtil..., but that's
// not needed if we avoid name collisions in the first place.
import { getAllPokemon } from '../util/api_util';

export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => (
  getAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);
