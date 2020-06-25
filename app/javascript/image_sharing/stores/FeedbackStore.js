import { observable } from 'mobx';

export class FeedbackStore {
  /* Implement your feedback store*/
  @observable name;
  @observable feedback;

  constructor() {
    this.name = '';
    this.feedback = '';
  }

  setName(name) {
    this.name = name;
  }

  setFeedback(feedback) {
    this.feedback = feedback;
  }
}

export default FeedbackStore;
