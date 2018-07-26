<template>
    <li>{{product.name}} - {{product.description}}</li>
</template>

<script>
  export default {
    name: "Product",
    props: {
      product: Object
    }
  }
</script>

<style scoped>

</style>
