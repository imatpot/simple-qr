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

<style lang="scss">
@import url('https://fonts.googleapis.com/css?family=Lexend+Deca|Roboto&display=swap&subset=arabic,cyrillic,cyrillic-ext,devanagari,greek,greek-ext,latin-ext,vietnamese');
// @import url('assets/scss/_reset.scss');

html, body {
  height: 100%;
  margin: 0;
}

#app {
  font-family: 'Roboto', sans-serif;
  min-height: 100%;
  background: black;
  color: white;
  display: flex;
  justify-content: center;
  align-items: center;

  h1 {
    font-family: 'Lexend Deca', sans-serif;
  }
}
</style>
