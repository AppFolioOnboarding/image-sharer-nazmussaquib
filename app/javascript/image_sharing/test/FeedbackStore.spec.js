/* eslint-env mocha */

import { expect } from 'chai';
import { FeedbackStore } from '../stores/FeedbackStore';

describe('FeedbackStore', () => {
  it('sets name and feedback in store', () => {
    const store = new FeedbackStore();
    store.setName('john doe');
    store.setFeedback('jane doe');
    expect(store.name).to.eq('john doe');
    expect(store.feedback).to.eq('jane doe');
  });
});
