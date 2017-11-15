import React from 'react';
import {RECEIVE_ERRORS, CLEAR_ERRORS} from '../actions/error_actions';

const errorReducer = (state = [], action) => {

  switch(action.type) {
    case CLEAR_ERRORS:
      return state;
    case RECEIVE_ERRORS:
      return action.errors;
    default:
      return state;
  }
};

export default errorReducer;
