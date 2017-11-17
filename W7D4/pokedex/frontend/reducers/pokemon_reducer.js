import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';
import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

export const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {

    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_ONE_POKEMON:
      const newState = Object.assign({}, state);
      newState[action.pokemon.id] = action.pokemon;
      return newState;
    default:
    return state;
  }

};
