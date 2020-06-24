import React, { Component } from 'react';
import { Row, Col } from 'reactstrap';
import PropTypes from 'prop-types';

class Form extends Component {
  /* Implement your Footer component here */
  // static propTypes = {
  //   title: PropTypes.string.isRequired
  // };

  render() {
    // const title = this.props.title;
    return (
      <div>
        <Row>
          <Col lg={{ size: 4, offset: 4 }}>
            Whatever
          </Col>
        </Row>
      </div>
    )
  }
}

export default Form;
