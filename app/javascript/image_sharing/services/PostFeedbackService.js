import { post } from '../utils/helper';

export class PostFeedbackService {
  /* Implement your service */
  constructor(params){
    this.params = params;
  }

  postFeedback = () => {
    post('/api/feedbacks', this.params);
  }
}

export default PostFeedbackService;
