/* eslint-env mocha */
import { expect } from 'chai';
import sinon from 'sinon';
import { FeedbackStore } from '../stores/FeedbackStore';
import * as api from '../utils/helper';

describe('FeedbackStore', () => {
  const sandbox = sinon.createSandbox();
  afterEach(() => sandbox.restore());
  it('sets name and feedback in store', () => {
    const store = new FeedbackStore();
    store.setName('john doe');
    store.setFeedback('jane doe');
    expect(store.name).to.eq('john doe');
    expect(store.feedback).to.eq('jane doe');
  });
  it('posts feedback', () => {
    const store = new FeedbackStore();
    store.setName('john doe');
    store.setFeedback('jane doe');
    const apiStub = sandbox.stub(api, 'post').resolves();
    return store.onFeedbackClick()
      .then(() => {
        sinon.assert.calledOnce(apiStub);
      });
  });
});
