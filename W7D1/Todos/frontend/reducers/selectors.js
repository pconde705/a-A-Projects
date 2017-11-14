

export const allTodos = ({todos}) => (
  Object.keys(todos).map((el) => ( todos[el] ))
);
