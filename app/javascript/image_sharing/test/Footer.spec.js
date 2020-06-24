import React from 'react';
import { mount } from 'enzyme';
import { expect } from 'chai';
import Footer from '../components/Footer';

describe('<Footer />', () => {
  it('the footer contains a string', () => {
    const wrapper = mount(<Footer title="title" />);
    expect(wrapper.text()).to.eq("title");
  });
});
