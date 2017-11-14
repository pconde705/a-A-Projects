export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos: todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo: todo
});


// Code written below is simply for testing in the console!!!
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
