import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';
import {uniqueId} from '../../util';

const TodoList = (props) => (
  <div>
    <ul>
      {props.todos.map((el, idx) => (
        <TodoListItem key={idx} todo={el}/>
      ))}
      <TodoForm receiveTodo={props.receiveTodo}/>
    </ul>
  </div>
);

export default TodoList;
