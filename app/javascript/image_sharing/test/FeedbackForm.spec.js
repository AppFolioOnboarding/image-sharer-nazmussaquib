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
    wrapper.setState({ message: 'a message' });
    expect(wrapper.find('#forName').text()).to.eq('Your Name');
    expect(wrapper.find('#forFeedback').text()).to.eq('Comments');
    expect(wrapper.exists('#submit')).to.eq(true);
    expect(wrapper.find('#formNotice').text()).to.eq('a message');
    expect(wrapper.find('#submit').prop('onClick')).to.eq(wrapper.instance().onSubmit);
  });
});

