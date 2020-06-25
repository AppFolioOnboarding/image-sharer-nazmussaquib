import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { observer } from 'mobx-react';
import { PostFeedbackService } from '../services/PostFeedbackService';

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

  onFeedbackClick = (e) => {
    const params = {
      feedback: {
        name: this.props.store.name,
        feedback: this.props.store.feedback
      }
    };
    const service = new PostFeedbackService(params);
    service.postFeedback();
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
        <input type="button" value="Submit" id="submit" onClick={this.onFeedbackClick} />
      </div>
    );
  }
}

export default FeedbackForm;
