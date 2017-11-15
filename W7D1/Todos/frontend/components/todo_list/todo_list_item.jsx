
import React from 'react';


const TodoListItem = ({todo, removeTodo}) => (
    <li>
      <strong>{todo.title}</strong>,
      {todo.body}
      <button onClick={() => removeTodo(todo.id)}>Remove Todo</button>
    </li>

);

export default TodoListItem;
