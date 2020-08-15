<template>
  <main id="app">
    <qr-gen></qr-gen>
  </main>
</template>

<script>
import QrGen from './components/QrGen.vue';

export default {
  name: 'App',
  components: {
    QrGen,
  },
};
</script>

<style lang="scss">
html,
body {
  height: 100%;
  margin: 0;
}

main {
  font-family: sans-serif;
  min-height: 100%;
  background: white;
  color: black;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
