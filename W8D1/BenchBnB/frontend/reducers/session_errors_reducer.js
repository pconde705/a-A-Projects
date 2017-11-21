import {RECEIVE_ERRORS, RECEIVE_CURRENT_USER} from '../actions/session_actions';

const _nullErrors = [];


export default (state = _nullErrors, action) => {
  Object.freeze(state)
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return _nullErrors;
    case RECEIVE_ERRORS:
      return action.errors;
    default:
      return state;
  }
}
