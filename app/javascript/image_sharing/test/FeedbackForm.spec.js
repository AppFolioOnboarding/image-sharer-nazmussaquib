/* eslint-env mocha */

import React from 'react';
import { mount } from 'enzyme';
import { expect } from 'chai';
import FeedbackForm from '../components/FeedbackForm';
import { FeedbackStore } from '../stores/FeedbackStore';

describe('<FeedbackForm />', () => {
  it('the form contains fields', () => {
    const store = new FeedbackStore();
    const wrapper = mount(<FeedbackForm store={store} />);
    expect(wrapper.find('#forName').text()).to.eq('Your Name');
    expect(wrapper.find('#forFeedback').text()).to.eq('Comments');
    expect(wrapper.exists('#submit')).to.eq(true);
  });
});

