import React from 'react';
import {Link} from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {
  if (currentUser) {
    return (
      <div>
        <h2>Welcome {currentUser.username}</h2>
        <button onClick={logout}></button>
      </div>
    )
  } else {
    return (
      <div>
        <Link to='/signup'>Sign up</Link>
        <br /><br />
        <Link to='/login'>Log in</Link>
      </div>
    )
  }
}

export default Greeting;
