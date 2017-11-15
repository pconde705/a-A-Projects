import { connect } from 'react-redux';
import TodoList from './todo_list';

// Actions
import { receiveTodos, receiveTodo, fetchTodos, createTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors,
  state
});

const mapDispatchToProps = dispatch => ({
  receiveTodos: () => dispatch(receiveTodos()),
  createTodo: todo => dispatch(createTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos())

});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
