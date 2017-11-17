import { LOADING, FINISHED_LOADING } from '../actions/ui_actions';

export const uiReducer = (state = {pokeDisplay: null, errors: {}, loading: {}}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case LOADING:
      return {loading: true};
    case FINISHED_LOADING:
      return {loading: false};
    // case RECEIVE_ONE_
    default:
      return state;
  }
};
