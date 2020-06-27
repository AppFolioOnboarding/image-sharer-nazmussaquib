import { action, observable } from 'mobx';
import { PostFeedbackService } from '../services/PostFeedbackService';

export class FeedbackStore {
  /* Implement your feedback store*/
  @observable name;
  @observable feedback;

  constructor() {
    this.name = '';
    this.feedback = '';
  }

  @action
  setName(name) {
    this.name = name;
  }

  @action
  setFeedback(feedback) {
    this.feedback = feedback;
  }

  onFeedbackClick = () => {
    const params = {
      feedback: {
        name: this.name,
        feedback: this.feedback
      }
    };
    const service = new PostFeedbackService(params);
    return service.postFeedback();
  }
}

export default FeedbackStore;
