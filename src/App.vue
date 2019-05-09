<template>
  <div id="app">
    <QrGen />
  </div>
</template>

<script>
import QrGen from './components/QrGen.vue';

export default {
  name: 'App',
  components: {
    QrGen
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
