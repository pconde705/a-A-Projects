export const fetchTodos = () => (
  $.ajax({
    method: 'GET',
    url: '/api/todos'
  })
);

export const create = (todo) => (
  $.ajax({
    method: 'POST',
    url: '/api/todos',
    data: todo
  })
);
