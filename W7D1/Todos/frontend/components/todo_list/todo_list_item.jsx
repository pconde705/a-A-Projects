
import React from 'react';


const TodoListItem = ({todo}) => (

    <li><strong>{todo.title}</strong>, {todo.body}</li>

);

export default TodoListItem;
