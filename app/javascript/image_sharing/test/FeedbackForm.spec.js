/* eslint-env mocha */

import React from 'react';
import { mount } from 'enzyme';
import { expect } from 'chai';
import FeedbackForm from '../components/FeedbackForm';

describe('<FeedbackForm />', () => {
  it('the form contains fields', () => {
    const wrapper = mount(<FeedbackForm />);
    expect(wrapper.find('#forName').text()).to.eq('Your Name');
    expect(wrapper.find('#forFeedback').text()).to.eq('Comments');
    expect(wrapper.exists('#submit')).to.eq(true);
  });
});

