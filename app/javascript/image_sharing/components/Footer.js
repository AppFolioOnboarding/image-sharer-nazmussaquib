import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';

class Footer extends Component {
  /* Implement your Footer component here */
  static propTypes = {
    title: PropTypes.string.isRequired
  };

  render() {
    const title = this.props.title;
    return (
      <div>
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            <span className='text-center'>
              {title}
            </span>
          </Col>
        </Row>
      </div>
    )
  }
}

export default Footer;
