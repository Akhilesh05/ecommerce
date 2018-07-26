<template>
  <div id="app">
    <img src="./assets/logo.png">
    <input type="text" v-model="filter" />
    <ProductList :filter="filter" :products="products" />
  </div>
</template>

<script>
import ProductList from "./components/ProductList";
import Axios from 'axios';

export default {
  name: 'app',
  components: {
    ProductList
  },
  data() {
    return {
      products: [],
      filter: ''
    };
  },
  created() {
    Axios.get('/api/products').then(response => this.products = response.data)
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
