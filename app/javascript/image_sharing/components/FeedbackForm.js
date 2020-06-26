import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { observer } from 'mobx-react';

@observer
class FeedbackForm extends Component {
  /* Add Prop Types check*/
  static propTypes = {
    store: PropTypes.object.isRequired
  };

  onFeedbackChange = (e) => {
    this.props.store.setFeedback(e.currentTarget.value);
  }

  onNameChange = (e) => {
    this.props.store.setName(e.currentTarget.value);
  }

  render() {
    return (
      <div>
        <label htmlFor="name" id="forName">Your Name<br />
          <input name="name" id="name" type="text" onChange={this.onNameChange} /><br />
        </label>
        <br />
        <label htmlFor="feedback" id="forFeedback">Comments<br />
          <textarea name="feedback" id="feedback" onChange={this.onFeedbackChange} /><br />
        </label>
        <br />
        <input type="button" value="Submit" id="submit" />
      </div>
    );
  }
}

export default FeedbackForm;
