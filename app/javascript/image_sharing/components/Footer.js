import React, { Component } from 'react';
import PropTypes from 'prop-types';

class Footer extends Component {
  /* Implement your Footer component here */
  static propTypes = {
    title: PropTypes.string.isRequired
  };

  render() {
    const title = this.props.title;
    return (
      <div className="fixed-bottom">
        <p className="text-center">
          {title}
        </p>
      </div>
    );
  }
}

export default Footer;
