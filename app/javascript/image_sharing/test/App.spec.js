/* eslint-env mocha */

import React from 'react';
import { mount } from 'enzyme';
import { expect } from 'chai';
import App from '../components/App';
import Footer from '../components/Footer';
import Header from '../components/Header';
import { FeedbackStore } from '../stores/FeedbackStore';

describe('<App />', () => {
  it('mounts and renders header and footer', () => {
    const stores = { feedbackStore: new FeedbackStore() };
    const wrapper = mount(<App stores={stores} />);
    const header = wrapper.find(Header);
    const footer = wrapper.find(Footer);
    expect(header.props().title).to.eq('Tell us what you think');
    expect(footer.props().title).to.eq('Copyright: Appfolio Inc. Onboarding');
  });
});
