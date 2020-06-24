import React, { Component } from 'react';
import Header from './Header';
import Footer from './Footer';

export default class App extends Component {
  /* Add Prop Types check*/
  render() {
    return (
      <div>
        <Header title="Tell us what you think" />
        <Footer title="Copyright: Appfolio Inc. Onboarding" />
      </div>
    );
  }
}
