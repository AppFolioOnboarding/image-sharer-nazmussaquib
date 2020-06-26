import React, { Component } from 'react';
import { inject } from 'mobx-react';
import PropTypes from 'prop-types';
import Header from './Header';
import FeedbackForm from './FeedbackForm';
import Footer from './Footer';

class App extends Component {
  /* Add Prop Types check*/
  static propTypes = {
    stores: PropTypes.object.isRequired
  };

  render() {
    const store = this.props.stores.feedbackStore;
    return (
      <div>
        <Header title="Tell us what you think" />
        <FeedbackForm store={store} />
        <Footer title="Copyright: Appfolio Inc. Onboarding" />
      </div>
    );
  }
}

export default inject('stores')(App);
