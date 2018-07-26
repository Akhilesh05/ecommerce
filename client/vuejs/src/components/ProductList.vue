<template>
    <ul>
        <Product v-for="product in filteredProducts" :product="product" :key="product.id" />
    </ul>
</template>

<script>
  import Product from "./Product";

  export default {
    name: "ProductList",
    components: { Product },
    props: {
      products: Array,
      filter: String
    },
    computed: {
      filteredProducts() {
        const regexp = new RegExp(this.filter, 'i');
        return this.products.filter(prod => regexp.test(`${prod.name} - ${prod.description}`));
      }
    }
  }
</script>

<style scoped>

</style>