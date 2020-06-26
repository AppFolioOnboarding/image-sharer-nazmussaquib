import { action, observable } from 'mobx';
import { PostFeedbackService } from '../services/PostFeedbackService';

export class FeedbackStore {
  /* Implement your feedback store*/
  @observable name;
  @observable feedback;
  @observable message;

  constructor() {
    this.name = '';
    this.feedback = '';
    this.message = '';
  }

  @action
  setName(name) {
    this.name = name;
  }

  @action
  setFeedback(feedback) {
    this.feedback = feedback;
  }

  @action
  setMessage(message) {
    this.message = message;
  }

  onFeedbackClick = () => {
    const params = {
      feedback: {
        name: this.name,
        feedback: this.feedback
      }
    };
    const service = new PostFeedbackService(params);
    service.postFeedback()
      .then(() => this.setMessage('success'))
      .catch(() => this.setMessage('failure'));
  }
}

export default FeedbackStore;
