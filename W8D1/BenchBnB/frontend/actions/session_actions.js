import {postNewUser, postNewSession, deleteSession} from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
});

const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const login = (user) => dispatch => (
  postNewSession.then(session => dispatch(receiveCurrentUser(session)))
);

export const logout = () => dispatch => (
  deleteSession.then(session => dispatch(receiveCurrentUser(null)))
);

export const signup = (user) => dispatch => (
  postNewUser.then(session => dispatch(receiveCurrentUser(session)))
)
