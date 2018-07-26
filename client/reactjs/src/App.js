import React, { Component } from 'react';
import Axios from 'axios';
import logo from './logo.svg';
import './App.css';

const image = {
  src: logo,
  width: '200px',
  height: '200px',
  alt: 'Logo'
};

function Product(props) {
  return (
    <li className="list-group-item">
      <span>{props.product.name} - </span>
      <strong>{props.product.description}</strong>
    </li>
  )
}

class ProductsList extends Component {
  get filteredProducts() {
    const regexp = new RegExp(this.props.filter, 'i');
    return this.props.products.filter(prod => {
      return regexp.test(`${prod.name} - ${prod.description}`)
    })
  }

  get products() {
    return this.filteredProducts.map(prod => <Product key={prod.id} product={prod}/>)
  }

  render() {
    return <ul className="list-group">{this.products}</ul>
  }
}

class App extends Component {
  constructor() {
    super();
    this.state = {
      products: [],
      filterValue: ''
    };
    Axios.get('/api/products').then(response => this.setState({products: response.data}))
  }

  handleChange(event) {
    this.setState({filterValue: event.target.value});
  }

  render() {
    return (
      <div className="row">
        <div className="col-md-3">
          <img {...image} />
        </div>
        <div className="col-md-9">
          <div className="row col">
            <div className="col">
              <input className="form-control" type="text" value={this.state.filterValue} onChange={this.handleChange.bind(this)} />
            </div>
          </div>
          <div className="row col">
            <div className="col">
              <ProductsList filter={this.state.filterValue} products={this.state.products} />
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default App;
