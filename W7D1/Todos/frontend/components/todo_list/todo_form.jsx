import React from 'react';
import {uniqueId} from '../../util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {id: uniqueId(), title:"", body: "", done: false};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  updateTitle(e) {
    this.setState({title: e.target.value});
  }

  updateBody(e) {
    this.setState({body: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({title: "", body: ""});
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <br/>
          <label>Title:
          <input type="text" onChange={this.updateTitle} value={this.state.title}></input><br/><br/>
          </label>
          <label>Body: 
          <textarea onChange={this.updateBody} value={this.state.body}></textarea>
          </label>
          <br/><br/>
          <button>New List Item</button>
        </form>
      </div>
    );

  }


}

export default TodoForm;
